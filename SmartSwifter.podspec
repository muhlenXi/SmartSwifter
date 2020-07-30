
Pod::Spec.new do |s|
  s.name         = "SmartSwifter"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "A lightweight, practical extension  and tools for Swift"
  s.homepage     = "https://github.com/muhlenXi/SmartSwifter"
  s.author             = { "muhlenXi" => "muhlenxi@gmail.com" }
  s.social_media_url   = "http://muhlenxi.com"
  s.source       = { :git => "https://github.com/muhlenXi/SmartSwifter.git", :tag => "1.0.0" }


  s.platform     = :ios, "10.0"
  s.frameworks   = "UIKit", "Foundation"
  s.source_files  = "SmartSwifter/SmartSwifter/Sources/Extensions/*.swift", "SmartSwifter/SmartSwifter/Sources/Utils/*.swift"
  s.swift_version = "4.2"
end
