#
#  Be sure to run `pod spec lint BBTransitionManager.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "BBTransitionManager"
  s.version      = "0.3"
  s.summary      = "A simple wrapper around the UIPresentionController API. Just subclass and go"
  s.homepage     = "https://github.com/BenjaminBriggs/BBTransitionManager"
  s.screenshots  = "https://raw.githubusercontent.com/BenjaminBriggs/BBTransitionManager/master/Demo.gif"
  s.license      = "Apache License, Version 2.0"
  s.author       = { "Benjamin Briggs" => "ben.briggs@me.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/BenjaminBriggs/BBTransitionManager.git", :branch => "master", :tag => s.version }
  s.source_files = "BBTransitionManager/BBTransitionManager.swift", "BBTransitionManager/BBModalInsetTransition.swift"

end
