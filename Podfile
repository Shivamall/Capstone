# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'GoogleSignIn'
pod 'Firebase/Storage'
pod 'Firebase/Firestore'
pod 'Firebase/Messaging'
pod 'Firebase/Analytics'
pod 'Firebase/Database'
pod 'Firebase/Storage'
pod 'MessageKit'


target 'FlowClu' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FlowClu
  pod 'JTAppleCalendar'
end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
