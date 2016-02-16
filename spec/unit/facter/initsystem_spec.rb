require 'spec_helper'

describe 'initsystem' do
  before { Facter.clear }
  after { Facter.clear }

  let(:os) do
    {
      'name' => 'CentOS',
      'release' => { 'major' => '6' }
    }
  end

  before :each do
    allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    allow(Facter.fact(:os)).to receive(:value).and_return(os)
  end

  it "should return sysvinit on RHEL" do
    expect(Facter.fact(:initsystem).value).to match('sysvinit')
  end

  it "should return systemd on RHEL" do
    os['release']['major'] = '7'
    expect(Facter.fact(:initsystem).value).to match('systemd')
  end
end
