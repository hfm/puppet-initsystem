Facter.add(:initsystem) do
  confine :kernel => %w(Linux)
  setcode do
    os = Facter.value(:os)

    case os['name']
    when /(CentOS|Scientific|RedHat)/
      os['release']['major'].to_i >= 7 ? 'systemd' : 'sysvinit'
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
