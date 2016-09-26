MRuby::Gem::Specification.new('mruby-slack-notifier') do |spec|
  spec.license = 'MIT'
  spec.authors = 'OKUMURA Takahiro'
  spec.summary = 'Slack notifier'

  spec.add_dependency 'mruby-string-ext', core: 'mruby-string-ext'
  spec.add_dependency 'mruby-kernel-ext', core: 'mruby-kernel-ext'
  spec.add_dependency 'mruby-httprequest'
  spec.add_dependency 'mruby-polarssl'
  spec.add_dependency 'mruby-iijson'
end
