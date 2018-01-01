Pod::Spec.new do |s|

  s.name         = 'KGBadgeView'

  s.version      = '1.0.0'

  s.summary      = 'Add badge above the UIView elements'
  s.homepage     = 'https://github.com/Gypsyan/KGBadgeView'
  s.license      = 'Apache License, Version 2.0'
  s.authors      = { 'Ananth' => 'ananthanmymail@gmail.com' }
  s.source       = { :git => 'https://github.com/Gypsyan/KGBadgeView.git', :tag => s.version }
  s.source_files = 'KGBadgeView/**/*.swift'

  s.ios.deployment_target = '8.0'

  s.requires_arc = true

end
