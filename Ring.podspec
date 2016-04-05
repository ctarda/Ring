
Pod::Spec.new do |s|
  s.name             = "Ring"
  s.version          = "1.0.0"
  s.summary          = "UIView subclass that presents a Ring."
  s.description      = <<-DESC
Ring is, well... a Ring. It can be used to mimic an activity ring, or a progress indicator.
                       DESC
  s.homepage         = "https://github.com/ctarda/Ring.git"
  s.license          = { type: "MIT", file: "LICENSE" }
  s.author           = "Cesar Tardaguila"
  s.source           = { git: "https://github.com/ctarda/Ring.git", tag: "#{s.version}" }
  s.social_media_url = 'https://twitter.com/ctarda'

  s.ios.deployment_target = "9.0"

  s.source_files = 'Ring/**/*.{swift,h}'

end