Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/centos64-i386"
  config.vm.hostname = "catalog"
  config.ssh.insert_key = false
  config.vm.provision "ApacheHTTPServer", type: "shell", path: "installApacheHTTPServer.sh"
  config.vm.provision "PHP", type: "shell", path: "installPHP.sh"
  config.vm.provision "MySQL", type: "shell", path: "installMySQL.sh"
  config.vm.provision "PHPMyAdmin", type: "shell", path: "installPHPMyAdmin.sh"
  config.vm.provision "Xdebug", type: "shell", path: "installXdebug.sh"
  config.vm.provision "CakePHP", type: "shell", path: "installCakePHP.sh"
  config.vm.provision "TimeZone", type: "shell", path: "setTimeZone.sh", run: "always"
  config.vm.provision "Start services", type: "shell", path: "startup.sh", run: "always", privileged: false
  config.vm.network "private_network", ip: "192.168.50.5"
end