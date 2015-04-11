require 'rspec-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'mocha/api'
# fixture_path = File.expand_path(File.join(__FILE__, '..', '..', 'fixtures'))
fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

RSpec.configure do |c|
  # c.module_path = File.join(fixture_path, 'modules')
  c.manifest_dir = File.join(fixture_path, 'manifests')
  c.mock_with :mocha
  c.default_facts = {
    :operatingsystem => 'Ubuntu',
    :osfamily =>  'Debian'
  }
end