#
#  Be sure to run `pod spec lint EmojiLogger.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name                  = "EmojiLogger"
  spec.version               = "1.0.0"
  spec.summary               = "A custom Logger that uses emojis to represent log levels"
  spec.description           = <<-DESC
                               A custom Logger that uses emojis to represent log levels.
                               DESC
  spec.homepage              = "https://github.com/SwiftMN/EmojiLogger"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = { "Steve Vlaminck" => "steve@vlaminck.com" }
  spec.source                = { :git => "https://github.com/SwiftMN/EmojiLogger.git", :tag => "#{spec.version}" }
  spec.source_files          = "Sources/**/*.swift"
  spec.ios.deployment_target = '12.0'
  spec.swift_version         = '5.1'
end
