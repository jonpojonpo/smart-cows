exec { 'anaconda_download':
  command =>'/usr/bin/curl -O https://repo.continuum.io/archive/Anaconda3-5.3.0-Linux-x86_64.sh',
  cwd =>'/tmp',
  creates =>'/tmp/Anaconda3-5.3.0-Linux-x86_64.sh',
  onlyif => '/usr/bin/test ! -d /opt/anaconda'
}

exec { 'anaconda_install':
   command =>'/usr/bin/bash /tmp/Anaconda3-5.3.0-Linux-x86_64.sh -b -p /opt/anaconda',
   creates => '/opt/anaconda',
   require => Exec["anaconda_download"]
} 
