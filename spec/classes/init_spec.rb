require 'spec_helper'
describe 'init_daemon' do
  it { is_expected.to compile }
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('init_daemon') }
end
