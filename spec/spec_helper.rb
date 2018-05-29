require 'bundler/setup'
require 'pry'
require 'dotenv'
require 'simplecov'

Dotenv.load

SimpleCov.start do
  add_filter "spec/"
end

require 'jump_cloud'

JumpCloud::Agent.install

abort("Agent failed to supply a System ID. Exiting.") unless JumpCloud::Agent.wait_for_init

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
