require "spec_helper"

describe host(ENV["TARGET_HOST"]) do
    it { should be_resolvable }
end

#describe host(ENV["TARGET_HOST"]) do
#    it { should be_resolvable.by("hosts") }
#end

describe host(ENV["TARGET_HOST"]) do
    it { should be_resolvable.by("dns") }
end

describe command("cat /etc/sudoers") do
    its(:stdout) { should match /Defaults:ec2-user    !requiretty/ }
end

# not work?
#if os[:family] == "redhat"
describe command("cat /etc/sysconfig/clock") do
    its(:stdout) { should match /ZONE="Asia\/Tokyo"/ }
    its(:stdout) { should match /UTC=false/ }
end

describe command("cat /etc/sysconfig/network") do
    its(:stdout) { should match /HOSTNAME=#{ENV["TARGET_HOST"]}/ }
end

describe file("/etc/chef/ohai/hints/ec2.json") do
    it { should be_file }
end

