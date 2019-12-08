Pod::Spec.new do |s|
s.name         = "GITSNetwork"
s.version      = "0.0.3"
s.summary      = "A short description of swift-ios-framework."
s.homepage     = "https://source.gits.id/RnD/swift-ios-framework"
s.license      = "MIT (ios)"
s.author             = { "GITS Indonesia" => "yatnosudar@gits.co.id" }
s.source       = { :git => "https://source.gits.id/RnD/swift-ios-framework.git", :tag => "#{s.version}" }
s.source_files  = "GITSNetwork/Classes/**/*.{h,m,swift}"
s.resource_bundles = {'GITSNetwork' => ['GITSNetwork/Assets/**/*.{storyboard,xib,xcassets,json,imageset,png,plist}']}
s.resource = 'GITSNetwork/Assets/**'
s.platform         = :ios, "9.0"
s.dependency 'Alamofire', '~>4.8.1'
s.dependency 'SwiftyJSON', '~>4.2.0'

end
