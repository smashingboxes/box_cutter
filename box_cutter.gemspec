# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'box_cutter/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = ">= #{BoxCutter::RUBY_VERSION}"
  s.authors = ['leonelgalan']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-EOS
Box Cutter is inspired by thoughtbot's Suspenders. Just like Suspenders says, use Box Cutter if you're in a
rush to build something amazing; don't use it if you like missing deadlines.
  EOS

  s.email = 'leonel@smashingboxes.com'
  s.executables = ['box_cutter']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/smashingboxes/box_cutter'
  s.license = 'MIT'
  s.name = 'box_cutter'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using debatable best practices."
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = BoxCutter::VERSION

  s.add_dependency 'bundler', '~> 1.3'
  s.add_dependency 'rails', BoxCutter::RAILS_VERSION

  s.add_development_dependency 'rspec', '~> 3.0'
end
