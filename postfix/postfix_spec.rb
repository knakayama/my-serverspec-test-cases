require "spec_helper"

describe command("alternatives --display mta") do
    its(:stdout) { should match /link currently points to \/usr\/sbin\/sendmail.postfix/ }
end

describe package("postfix") do
    it { should be_installed }
end

describe service("postfix") do
    it { should be_enabled }
    it { should be_running }
end

describe port(25) do
    it { should be_listening.with("tcp") }
end

describe file('/etc/postfix/main.cf') do
    it { should be_file }
    its(:content) { should match /myhostname = #{ENV["TARGET_HOST"]}/ }
    its(:content) { should match /mydomain = #{ENV["TARGET_HOST"].split(".")[1..-1].join(".")}/ }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should be_mode 644 }
end

