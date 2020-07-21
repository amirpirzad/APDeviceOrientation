//
//  APDeviceOrientation.swift
//  APDeviceOrientation
//
//  Created by pirzad on 7/21/20.
//  Copyright © 2020 pirzad. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

public protocol APDeviceOrientationDelegate: class {
    func didChange(orientation: UIDeviceOrientation)
}

public class APDeviceOrientation {
    // MARK: - PublicVariable
    public static let shared = APDeviceOrientation()
    public var delegate: APDeviceOrientationDelegate?

    // MARK: - PrivateVariable
    private lazy var motionManager: CMMotionManager = {
           let motion = CMMotionManager()
           motion.accelerometerUpdateInterval = 0.1
           return motion
       }()
    private var deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation

    // MARK: - Lifecycle
    public func startMeasuring() {
        guard motionManager.isAccelerometerAvailable else {
            return
        }
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] (accelerometerData, error) in
            guard let strongSelf = self else {
                return
            }
            guard let accelerometerData = accelerometerData else {
                return
            }

            let acceleration = accelerometerData.acceleration
            let xxValue = -acceleration.x
            let yyValue = acceleration.y
            let zValue = acceleration.z
            let angle = atan2(yyValue, xxValue)
            var newDeviceOrientation = strongSelf.deviceOrientation
            let absoluteZ = fabs(zValue)

            if newDeviceOrientation == .faceUp || newDeviceOrientation == .faceDown {
                if absoluteZ < 0.845 {
                    if angle < -2.6 {
                        newDeviceOrientation = .landscapeRight
                    } else if angle > -2.05 && angle < -1.1 {
                        newDeviceOrientation = .portrait
                    } else if angle > -0.48 && angle < 0.48 {
                        newDeviceOrientation = .landscapeLeft
                    } else if angle > 1.08 && angle < 2.08 {
                        newDeviceOrientation = .portraitUpsideDown
                    }
                } else if zValue < 0 {
                    newDeviceOrientation = .faceUp
                } else if zValue > 0 {
                    newDeviceOrientation = .faceDown
                }
            } else {
                if zValue > 0.875 {
                    newDeviceOrientation = .faceDown
                } else if zValue < -0.875 {
                    newDeviceOrientation = .faceUp
                } else {
                    switch newDeviceOrientation {
                    case .landscapeLeft:
                        if angle < -1.07 {
                            newDeviceOrientation = .portrait
                        }
                        if angle > 1.08 {
                            newDeviceOrientation = .portraitUpsideDown
                        }
                    case .landscapeRight:
                        if angle < 0 && angle > -2.05 {
                            newDeviceOrientation = .portrait
                        }
                        if angle > 0 && angle < 2.05 {
                            newDeviceOrientation = .portraitUpsideDown
                        }
                    case .portraitUpsideDown:
                        if angle > 2.66 {
                            newDeviceOrientation = .landscapeRight
                        }
                        if angle < 0.48 {
                            newDeviceOrientation = .landscapeLeft
                        }
                    case .portrait:
                        if angle > -0.47 {
                            newDeviceOrientation = .landscapeLeft
                        }
                        if angle < -2.64 {
                            newDeviceOrientation = .landscapeRight
                        }
                    default:
                        if angle > -0.47 {
                            newDeviceOrientation = .landscapeLeft
                        }
                        if angle < -2.64 {
                            newDeviceOrientation = .landscapeRight
                        }
                    }
                }
            }
            if strongSelf.deviceOrientation != newDeviceOrientation {
                strongSelf.deviceOrientation = newDeviceOrientation
                strongSelf.delegate?.didChange(orientation: newDeviceOrientation)
            }
        }
    }

    public func stopMeasuring() {
        motionManager.stopAccelerometerUpdates()
    }

    public func setAccelerometer(Interval: TimeInterval) {
        motionManager.accelerometerUpdateInterval = Interval
    }

    public func isMeasuring() -> Bool {
        motionManager.isAccelerometerActive
    }
}
