source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion

group :test, :development do
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
  gem 'facter'
  gem 'metadata-json-lint'
end

gem 'puppet-blacksmith', group: :development
