Pod::Spec.new do |spec|
  spec.name         = 'IBM_Workshop_UI_Test'
  spec.version      = '1.0.0'
  spec.summary      = 'A summary of IBM_Workshop_UI_Test'
  spec.description  = 'A detailed description of IBM_Workshop_UI_Test.'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.platform     = :ios, '15.0'
  spec.homepage     = 'https://github.com/yourusername/IBM_Workshop_UI_Test'
  spec.author       = { 'Matas Dregva' => 'mataspauliusdregva@gmail.com' }

  # Specify the frameworks your pod depends on
  spec.vendored_frameworks = ['IBM_Workshop_UI_Test.xcframework']

  # Specify the source of your pod (replace with your actual repository URL)
  spec.source = { :git => 'https://github.com/Jok3r182/IBM_iOS_Workshop_Tests.git', :tag => spec.version.to_s }
end
