# Private define, do not use directly.
# Takes care about creating the *-install.conf files.

define autoinstall::install (
  $mac,
  $interfaces,
  $rootpassword,
  $wwwgroup,
  $webroot,
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
  $setup_user = no,
  $timezone = 'Europe/Berlin',
  $rootdisk = 'wd0',
  $use_duids = 'yes',
  $disklayout = 'a',
  $location_of_sets = undef,
  $no_prefetch_continue = undef,
  $checksum_failed = undef,
  $unverified_sets_continue = undef,
  $sitetgz = undef,
) {

  file { "${webroot}/${mac}-install.conf":
    owner   => 'root',
    group   => $wwwgroup,
    mode    => '0640',
    content => template('autoinstall/install.conf.erb'),
  }

}
