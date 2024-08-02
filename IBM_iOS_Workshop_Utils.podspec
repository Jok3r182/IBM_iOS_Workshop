Pod::Spec.new do |spec|
  spec.name         = 'IBM_iOS_Workshop_Utils'
  spec.version      = '1.0.0'
  spec.summary      = 'A summary of IBM_iOS_Workshop_Utils'
  spec.description  = 'A detailed description of IBM_iOS_Workshop_Utils.'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.platform     = :ios, '15.0'
  spec.homepage        = "git@github.com:Jok3r182/IBM_iOS_Workshop_Utils.git"
  spec.author          = { "Matas Dregva" => "mataspauliusdregva@gmail.com" }

  spec.vendored_frameworks = 'IBM_iOS_Workshop_Utils.xcframework'

  # Dependencies
  spec.dependency 'FirebaseCore'
  spec.dependency 'FirebaseAuth'
  spec.dependency 'FirebaseDatabase'

  spec.source = { :path => '.' }
end
