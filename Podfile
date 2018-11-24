# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'


def install_pods
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    pod 'SlackKit'
end

target 'Siridashi' do
	install_pods
end

target 'DashiKit' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    install_pods
end

target 'DashiIntents' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    install_pods
end


# https://github.com/firebase/firebase-ios-sdk/issues/1266
post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
end
