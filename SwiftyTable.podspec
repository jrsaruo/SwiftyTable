Pod::Spec.new do |s|
  s.name               = "SwiftyTable"
  s.version            = "1.0.0"
  s.license            = { :type => "MIT", :file => "LICENSE" }
  s.summary            = ""
  s.homepage           = "https://github.com/jrsaruo/SwiftyTable"
  s.author             = { "Yusaku Nishi" => "jrsaruo@gmail.com" }
  s.social_media_url   = "http://twitter.com/jrsaruo"

  s.platform           = :ios, "10.0"

  s.source             = { :git => "https://github.com/jrsaruo/SwiftyTable.git", :tag => "v1.0.0" }
  s.source_files       = "SwiftyTable/**/*.swift"

  s.requires_arc       = true
end
