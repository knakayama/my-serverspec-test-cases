require "spec_helper"

describe package("ntp") do
    it { should be_installed }
end

describe service("ntpd") do
    it { should be_enabled }
    it { should be_running }
end

describe port(123) do
    it { should be_listening.with("udp") }
end

