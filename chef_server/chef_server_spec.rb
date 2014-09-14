require "spec_helper"

describe service("chef-server") do
    it { should be_running }
end

