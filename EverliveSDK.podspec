Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "EverliveSDK"
s.summary = "EverliverSDK lets you take advantage of telerik backend services in your native app."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "[Dimitar Dimitrov]" => "[m1tkoregs@gmail.com]" }

# For example,
# s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/ddimitrov90/EverliveSDK"

# For example,
# s.homepage = "http://ddimitrov.net"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/ddimitrov90/EverliveSDK.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/ddimitrov90/EverliveSDK.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"
s.dependency 'Alamofire', '~> 3.0'
s.dependency 'EVReflection', '~> 2.6'
s.dependency 'SwiftyJSON', '~> 2.3.2'

# 8
s.source_files = "EverliveSDK/**/*.{swift}"

end