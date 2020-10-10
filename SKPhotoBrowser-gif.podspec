Pod::Spec.new do |s|
  s.name                = "SKPhotoBrowser-gif"
  s.version             = "6.2.0"
  s.summary             = "Simple PhotoBrowser/Viewer iwritten by pure swift. inspired by facebook, twitter photo browsers."
  s.homepage            = "https://github.com/ghostlordstar/SKPhotoBrowser-gif"
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "walker" => "heshanzhang@outlook.com" }
  s.source              = { :git => "https://github.com/ghostlordstar/SKPhotoBrowser-gif.git", :tag => s.version }
  s.platform            = :ios, "8.0"
  s.source_files        = "SKPhotoBrowser/**/*.{h,swift}"
  s.resources           = "SKPhotoBrowser/SKPhotoBrowser.bundle"
  s.requires_arc        = true
  s.frameworks          = "UIKit"
  s.swift_version       = '4.2'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
end
