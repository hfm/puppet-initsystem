require 'spec_helper'

describe 'initsystem' do
  after(:each) { Facter.clear }

  let(:os) do
    {
      'name' => 'dummy',
      'release' => { 'major' => '0' },
    }
  end

  before :each do
    Facter.clear
    allow(Facter.fact(:kernel)).to receive(:value).and_return('Linux')
    allow(Facter.fact(:os)).to receive(:value).and_return(os)
  end

  context 'Unknown' do
    it 'returns nil' do
      expect(Facter.fact(:initsystem).value).to be_nil
    end
  end

  context 'RHEL' do
    it 'returns sysvinit' do
      os['name'] = 'CentOS'
      os['release']['major'] = '5'
      expect(Facter.fact(:initsystem).value).to match('sysvinit')
    end

    it 'returns upstart' do
      os['name'] = 'CentOS'
      os['release']['major'] = '6'
      expect(Facter.fact(:initsystem).value).to match('upstart')
    end

    it 'returns systemd' do
      os['name'] = 'CentOS'
      os['release']['major'] = '7'
      expect(Facter.fact(:initsystem).value).to match('systemd')
    end
  end

  context 'Fedora' do
    it 'returns systemd' do
      os['name'] = 'Fedora'
      expect(Facter.fact(:initsystem).value).to match('systemd')
    end
  end

  context 'Debian' do
    it 'returns sysvinit' do
      os['name'] = 'Debian'
      os['release']['major'] = '7'
      expect(Facter.fact(:initsystem).value).to match('sysvinit')
    end

    it 'returns systemd' do
      os['name'] = 'Debian'
      os['release']['major'] = '8'
      expect(Facter.fact(:initsystem).value).to match('systemd')
    end
  end

  context 'Ubuntu' do
    it 'returns upstart' do
      os['name'] = 'Ubuntu'
      os['release']['major'] = '14.04'
      expect(Facter.fact(:initsystem).value).to match('upstart')
    end

    it 'returns systemd' do
      os['name'] = 'Ubuntu'
      os['release']['major'] = '16.04'
      expect(Facter.fact(:initsystem).value).to match('systemd')
    end
  end

  context 'SLES' do
    it 'returns upstart' do
      os['name'] = 'SLES'
      os['release']['major'] = '11'
      expect(Facter.fact(:initsystem).value).to match('redhat')
    end

    it 'returns systemd' do
      os['name'] = 'SLES'
      os['release']['major'] = '12'
      expect(Facter.fact(:initsystem).value).to match('systemd')
    end
  end
end
