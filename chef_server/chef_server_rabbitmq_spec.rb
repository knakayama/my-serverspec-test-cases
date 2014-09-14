require "spec_helper"

describe service("rabbitmq") do
    it { should be_running }
end

describe port(4369) do
    it { should be_listening.with("tcp") }
end

