
Pod::Spec.new do |spec|
  spec.name         = "APDeviceOrientation"
  spec.version      = "0.0.2"
  spec.summary      = "this library detect device orientation"

  spec.description  = <<-DESC
This CocoaPods library helps you detect device orientation using motion.
                   DESC

  spec.homepage     = "https://github.com/amirpirzad/APDeviceOrientation"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "amirpirzad" => "pirzad7@gmail.com" }

  spec.ios.deployment_target = "8.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/amirpirzad/APDeviceOrientation.git", :tag => "#{spec.version}" }
  spec.source_files  = "APDeviceOrientation/*.{h,m,swift}"
end
