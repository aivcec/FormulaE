platform :ios, '9.0'

def app_pods
  pod 'FormulaAPI', :path => '../FormulaAPI'
  pod 'AlamofireNetworkActivityIndicator', '~> 2.1'
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'FacebookCore'	
  pod 'FacebookLogin'
end

target 'FormulaE' do
  use_frameworks!

  # Pods for FormulaE
  app_pods

  target 'FormulaEUnitTests' do
    inherit! :search_paths
  end


end
