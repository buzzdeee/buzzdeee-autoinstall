# Private define, do not use directly.
# Takes care about creating the *-install.conf files.

define autoinstall::install (
  $interfaces,
  $rootpassword,
  $wwwgroup,
  $webroot,
  $mac = undef,
  $dnsdomain = undef,
  $dnsserver = undef,
  $kbdlayout = undef,
  $hostname  = undef,
  $ipv4defgw = undef,
  $ipv6defgw = undef,
  $start_sshd = undef,
  $start_ntpd = undef,
  $run_xwindow = undef,
  $start_xdm  = undef,
  $ntp_server = undef,
  $use_console = undef,
  $console_speed = undef,
  $setup_user = undef,
  $user_fullname = undef,
  $user_password = undef,
  $user_sshkey = undef,
  $disable_rootssh = undef,
  $timezone = undef,
  $rootdisk = undef,
  $use_duids = undef,
  $disklayout = undef,
  $partitions = undef,
  $location_of_sets = undef,
  $no_prefetch_continue = undef,
  $checksum_failed = undef,
  $unverified_sets_continue = undef,
  $sitetgz = undef,
  $architecture = undef,
) {

  if $mac {
    $instfilepath = "${webroot}/${mac}-install.conf"
  } else {
    $instfilepath = "${webroot}/auto_install.conf"
  }

  if $disklayout == 'c' {
    if $mac {
      $partitionpath = "${webroot}/${mac}-partitions.conf"
      $autopartitioning_url = "http://${::fqdn}/${mac}-partitions.conf"
    } else {
      $partitionpath = "${webroot}/partitions.conf"
      $autopartitioning_url = "http://${::fqdn}/partitions.conf"
    }
    file { $partitionpath:
      owner   => 'root',
      group   => $wwwgroup,
      mode    => '0640',
      content => template('autoinstall/autoartitioning.erb'),
    }
  }
 
  file { $instfilepath:
    owner   => 'root',
    group   => $wwwgroup,
    mode    => '0640',
    content => template('autoinstall/install.conf.erb'),
  }
}
