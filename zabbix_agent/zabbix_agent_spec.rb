require 'spec_helper'

describe package('zabbix-agent') do
    it { should be_installed }
end

describe service('zabbix-agent') do
    it { should be_enabled }
    it { should be_running }
end

describe port(10050) do
    it { should be_listening.with('tcp') }
end

describe file('/etc/zabbix/zabbix_agentd.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    its(:content) { should match /^Server=(127\.0\.0\.1|172\.31\.21\.235)$/ }
end

