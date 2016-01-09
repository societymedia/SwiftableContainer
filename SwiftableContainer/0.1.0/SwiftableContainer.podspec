Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "SwiftableContainer"
  s.summary = "A simple Dependency Container written in Swift."
  s.requires_arc = true

  # 2
  s.version = "0.1.0"

  # 3
  s.license = "MIT"

  # 4 - Replace with your name and e-mail address
  s.author = { "Tony Merante" => "merante@gmail.com" }

  # For example,
  # s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }


  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/societymedia/SwiftableContainer"

  # For example,
  # s.homepage = "https://github.com/JRG-Developer/RWPickFlavor"


  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/societymedia/SwiftableContainer.git", :tag => "#{s.version}"}

  # For example,
  # s.source = { :git => "https://github.com/JRG-Developer/RWPickFlavor.git", :tag => "#{s.version}"}


  # 7
  s.dependency 'Quick', '~> 0.8.0'
  s.dependency 'Nimble', '3.0.0'


  # 8
  s.source_files = "SwiftableContainer/**/*.{swift}"

  # 9
  s.resources = "SwiftableContainer/**/*.{png,jpeg,jpg,storyboard,xib}"
end