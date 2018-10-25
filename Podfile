platform :ios, '9.0'

def app_pods
  # To use FormulaAPI as a developer pod:
  # Put FormulaAPI project folder in the same level as this project
  # and switch pod FormulaAPI specification for this
  # pod 'FormulaAPI', :path => '../FormulaAPI'

  pod 'FormulaAPI', :git => 'https://github.com/aivcec/FormulaAPI.git'

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
