#
# Be sure to run `pod lib lint AnimableRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AnimableRefresh'
  s.version          = '0.1.0'
  s.summary          = 'A customizable refresh control for `ScrollView`'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/thibaut.richez@benextcompany.com/AnimableRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thibaut Richez' => 'thibaut.richez@benextcompany.com' }
  s.source           = { :git => 'https://github.com/thibaut.richez@benextcompany.com/AnimableRefresh.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'AnimableRefresh/Classes/**/*'
  s.frameworks = 'UIKit'
end
