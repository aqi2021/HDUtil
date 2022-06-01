#
# Be sure to run `pod lib lint HDUtil.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HDUtil'
  s.version          = '0.1.4'
  s.summary          = 'A short description of HDUtil.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/aqi2021/HDUtil'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hsf' => 'huangsf2021@163.com' }
  s.source           = { :git => 'https://github.com/aqi2021/HDUtil.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  
#  s.public_header_files = 'HDUtil/Classes/HDUtil.h'
  s.source_files = 'HDUtil/Classes/HDUtil.h'


  # Macro
  s.subspec 'Macro' do |ss|
    ss.source_files = 'HDUtil/Classes/Macro/*.{h,m}'
  end
  
  # Device
  s.subspec 'Device' do |ss|
    ss.source_files = 'HDUtil/Classes/Device/*.{h,m}'
  end

  # Helper
  s.subspec 'Helper' do |ss|
    ss.source_files = 'HDUtil/Classes/Helper/*.{h,m}'
  end
   
   
#  s.resource_bundles = {
#   'HDUtil' => ['HDUtil/Assets/*.png']
#  }
  s.frameworks = 'UIKit', 'Foundation'
#  s.dependency 'AFNetworking', '~> 2.3'
  
  
end
