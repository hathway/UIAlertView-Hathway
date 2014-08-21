Pod::Spec.new do |s|
  s.name         = "UIAlertView+Hathway"
  s.version      = "0.0.1"
  s.summary      = "Category for alerts with blocks." 
  s.homepage     = "https://github.com/hathway/UIAlertView-Hathway"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Eneko Alonso" => "eneko.alonso@gmail.com" }
  s.social_media_url   = "http://twitter.com/eneko"

  s.platform     = :ios
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/hathway/UIAlertView-Hathway.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.framework  = "UIKit"
  s.requires_arc = true
end
