require "spec_helper"

describe package("zabbix") do
    it { should be_installed }
end

describe service("zabbix-server") do
    it { should be_enabled }
end

describe service("zabbix_server") do
    it { should be_running }
end

describe port(10051) do
    it { should be_listening.with("tcp") }
end

describe file("/etc/zabbix/zabbix_server.conf") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "zabbix" }
    it { should be_mode 540 }
end

describe command("mysql -uroot -e 'show databases' | grep zabbix") do
    it { should return_stdout 'zabbix' }
end

describe command("mysql -uroot -e 'show grants for zabbix@localhost'") do
    it { should return_exit_status 0 }
end

