Pod::Spec.new do |s|
  s.name               = "SwiftyTable"
  s.version            = "1.1"
  s.license            = { :type => "MIT", :file => "LICENSE" }
  s.summary            = "Pure-Swift library for statically typed table components."
  s.homepage           = "https://github.com/jrsaruo/SwiftyTable"
  s.author             = { "Yusaku Nishi" => "jrsaruo@gmail.com" }
  s.social_media_url   = "http://twitter.com/jrsaruo"

  s.platform           = :ios, "10.0"

  s.source             = { :git => "https://github.com/jrsaruo/SwiftyTable.git", :tag => "v#{s.version}" }
  s.source_files       = "SwiftyTable/**/*.swift"

  s.requires_arc       = true
end
