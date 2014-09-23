require "spec_helper"

describe package("mysql55") do
    it { should be_installed }
end

describe service("mysqld") do
    it { should be_enabled }
    it { should be_running }
end

describe port("3306") do
    it { should be_listening.with("tcp") }
end

describe file("/etc/my.cnf") do
    it { should be_file }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should be_mode 644 }
    its(:content) { should match /character-set-server=utf8/ }
    its(:content) { should match /skip-character-set-client-handshake/ }
    its(:content) { should match /innodb_file_per_table/ }
    its(:content) { should match /innodb_buffer_pool_size=\d+M/ }
    its(:content) { should match /innodb_log_file_size=\d+M/ }
    its(:content) { should match /innodb_log_files_in_group=2/ }
end


