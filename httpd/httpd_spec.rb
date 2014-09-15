require "spec_helper"

describe package("httpd24") do
    it { should be_installed }
end

describe service("httpd") do
    it { should be_enabled }
    it { should be_running }
end

%w{80 449}.each do |p|
    describe port(p) do
        it { should be_listening.with("tcp") }
    end
end

describe file("/etc/httpd/conf/httpd.conf") do
    it { should be_file }
    its(:content) { should match /ServerName #{ENV["TARGET_HOST"]}:80/ }
    it { should be_owned_by "root" }
    it { should be_grouped_into "root" }
    it { should be_mode 644 }
end

end

