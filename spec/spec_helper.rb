require 'bundler/setup'
require 'pry'
require 'dotenv'
require 'simplecov'
require 'jump_cloud'

Dotenv.load

SimpleCov.start do
  add_filter "spec/"
  add_filter "app/lib/thrift_client.rb" # this is generated from thrift
end

JumpCloud::Agent.install

sleep 10

puts JumpCloud::Agent.config

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end
