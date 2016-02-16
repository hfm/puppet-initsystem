require 'spec_helper'
describe 'initsystem' do
  it { is_expected.to compile }
  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('initsystem') }
end
