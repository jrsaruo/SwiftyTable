version = ENV["LIBRARY_VERSION"]
exit 1 if version.to_s.empty?

Pod::Spec.new do |s|
  s.name                    = "SwiftyTable"
  s.version                 = version
  s.license                 = { :type => "MIT", :file => "LICENSE" }
  s.summary                 = "Pure-Swift library for statically typed table components."
  s.homepage                = "https://github.com/jrsaruo/SwiftyTable"
  s.author                  = { "Yusaku Nishi" => "jrsaruo@gmail.com" }
  s.social_media_url        = "http://twitter.com/jrsaruo"

  s.platform                = :ios, "12.0"
  s.ios.deployment_target   = '12.0'
  
  s.swift_version           = '5.0'

  s.source                  = { :git => "https://github.com/jrsaruo/SwiftyTable.git", :tag => s.version }
  s.source_files            = "Sources/**/*.swift"

  s.requires_arc            = true
end
