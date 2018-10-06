# Fact: init_daemon
#
# Purpose: Determine the name of initsystem (init daemon)

Facter.add(:initsystem) do
  confine kernel: ['Linux']
  setcode do
    os = Facter.value(:os)

    case os['name']
    when %r{(CentOS|Scientific|RedHat)}
      case os['release']['major'].to_i
      when 5
        'sysvinit'
      when 6
        'upstart'
      when 7
        'systemd'
      else
        'systemd'
      end
    when 'Fedora'
      'systemd'
    when 'Debian'
      if os['release']['major'].to_i > 7
        'systemd'
      else
        'sysvinit'
      end
    when 'Ubuntu'
      version = os['release']['major']
      major = version.split('.')[0]
      if major.to_i >= 15
        'systemd'
      else
        'upstart'
      end
    when 'SLES'
      if os['release']['major'].to_i > 11
        'systemd'
      else
        'redhat'
      end
    else
      nil
    end
  end
end

Facter.add(:init_daemon) do
  setcode do
    Facter.value(:initsystem)
  end
end
