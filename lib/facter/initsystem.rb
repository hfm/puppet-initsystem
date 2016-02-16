# Fact: init_daemon
#
# Purpose: Determine the name of initsystem (init daemon)

Facter.add(:initsystem) do
  confine :kernel => %w(Linux)
  setcode do
    os = Facter.value(:os)

    case os['name']
    when /(CentOS|Scientific|RedHat)/
      case os['release']['major'].to_i
      when 5 then 'sysvinit'
      when 6 then 'upstart'
      when 7 then 'systemd'
      end
    when 'Fedora'
      'systemd'
    when 'Debian'
      os['release']['major'].to_i >= 8 ? 'systemd' : 'sysvinit'
    when 'Ubuntu'
      case os['release']['major']
      when '15.04', '15.10', '16.04'
        'systemd'
      else
        'upstart'
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
