# APDeviceOrientation

## Installation
APDeviceOrientation is available through CocoaPods. To install it, simply add the following line to your Podfile:
```bash
pod 'APDeviceOrientation'
```

## Usage
```bash
import APDeviceOrientation
```

## Start measuring
```bash
APDeviceOrientation.shared.startMeasuring()
APDeviceOrientation.shared.delegate = self
```

## Confrom protocol
```bash

extension YourController: APDeviceOrientationDelegate {
    func didChange(orientation: UIDeviceOrientation) {
        // update UI in main thread
        DispatchQueue.main.async { [weak self] in
            switch orientation {
            case .unknown:
                print("unknown")
            case .portrait:
                print("portrait")
            case .portraitUpsideDown:
                print("portraitUpsideDown")
            case .landscapeLeft:
                print("landscapeLeft")
            case .landscapeRight:
                print("landscapeRight")
            case .faceUp:
                print("faceUp")
            case .faceDown:
                print("faceDown")
            default:
                print("default")
            }
        }
    }
}
```

## Stop measuring
```bash
APDeviceOrientation.shared.stopMeasuring()
```

## Check is measuring
```bash
APDeviceOrientation.shared.isMeasuring()
```

## Custom interval
```bash
APDeviceOrientation.shared.setAccelerometer(Interval: 1.0)
```

## Author
AmirPirzad pirzad7@gmail.com 🇮🇷

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.


## License
[MIT](https://choosealicense.com/licenses/mit/)
