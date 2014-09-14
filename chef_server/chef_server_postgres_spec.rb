require "spec_helper"

describe service("postgres") do
    it { should be_running }
end

describe port(5432) do
    it { should be_listening.with("tcp") }
end

