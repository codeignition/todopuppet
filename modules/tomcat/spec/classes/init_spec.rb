require 'spec_helper'
describe 'tomcat' do
  let(:facts) { {'osfamily' => 'Debian', 'lsbdistid' => 'debian', 'lsbdistcodename' => 'a', 'operatingsystem' => 'Ubuntu'} }

  context 'with defaults for all parameters' do
    it { should contain_class('java') }
  end
end
