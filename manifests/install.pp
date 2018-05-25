class hep_oslibs::install(){
  if $facts['os']['family'] == 'RedHat' {
    if $facts['os']['release']['major'] == '7' {
      $repo_source = "http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-repo-1.0.0-1.el7.noarch.rpm"
      $package = "HEP_OSlibs"
    }elsif $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] == '6' {
      $repo_source = "http://linuxsoft.cern.ch/wlcg/sl6/x86_64/wlcg-repo-1.0.0-1.el6.noarch.rpm"
      $package = "HEP_OSlibs_SL6"
    }
    package { 'wlcg-repo':
      ensure => installed,
      source => "$repo_source",
      provider => rpm,
    }
    package { "$package":
      ensure => installed,
      require => Package['wlcg-repo'],
    }
  }
}
