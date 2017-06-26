# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/az_sidekiq/version'

Gem::Specification.new do |spec|
  spec.name          = 'az_sidekiq'
  spec.version       = AzSidekiq::VERSION
  spec.authors       = ['Guillaume Terral']
  spec.email         = ['gterral2@gmail.com']

  spec.summary       = 'Add search for Sidekiqweb'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'sidekiq', '>= 3.1.4'
  spec.add_development_dependency 'sinatra'
end
