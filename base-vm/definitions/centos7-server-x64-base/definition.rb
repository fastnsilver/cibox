Veewee::Definition.declare({
  :cpu_count => '4',
  :memory_size=> '4096',
  :disk_size => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'RedHat_64',
  :iso_file => "CentOS-7.0-1406-x86_64-DVD.iso",
  :iso_src => "http://mirror-centos.hostingswift.com/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso",
  :iso_md5 => "713ea7847adcdd1700e92429f212721a",
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 10000,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "veewee",
  :ssh_password => "veewee",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [
    "base.sh",
    "git.sh",
    "docker.sh",
    #"chef.sh",
    "vagrant.sh",
    "virtualbox.sh",
    #"vmfusion.sh",
    "zerodisk.sh",
    "cleanup.sh"
  ],
  :postinstall_timeout => 10000
})
