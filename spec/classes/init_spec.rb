require 'spec_helper'
describe 'init_daemon' do

  context 'with defaults for all parameters' do
    it { should contain_class('init_daemon') }
  end
end
