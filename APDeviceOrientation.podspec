
Pod::Spec.new do |spec|
  spec.name         = "APDeviceOrientation"
  spec.version      = "0.6"
  spec.summary      = "Detect device orientation"

  spec.description  = <<-DESC
  This library helps you detect the device orientation using motion even if the rotation is locked.
                   DESC

  spec.homepage     = "https://github.com/amirpirzad/APDeviceOrientation"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "amir pirzad" => "pirzad7@gmail.com" }

  spec.ios.deployment_target = "8.0"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/amirpirzad/APDeviceOrientation.git", :tag => "#{spec.version}" }
  spec.source_files  = "APDeviceOrientation/*.{h,m,swift}"
end
