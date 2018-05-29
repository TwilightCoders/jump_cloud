require 'jump_cloud/version'

# STL
require 'active_support'
require 'active_support/core_ext'
require 'active_support/dependencies'
require 'logger'

require 'her'

# App
require 'jump_cloud/middleware'
require 'jump_cloud/api'
require 'jump_cloud/agent'

# Models
require 'jump_cloud/api/model'
require 'jump_cloud/api/v1/model'
require 'jump_cloud/api/v2/model'

require 'jump_cloud/api/user'
require 'jump_cloud/api/system'
require 'jump_cloud/api/group'
require 'jump_cloud/api/association'

require 'jump_cloud/api/user/association'
require 'jump_cloud/api/user/group'

require 'jump_cloud/api/system/association'
require 'jump_cloud/api/system/group'

# Shims
require 'jump_cloud/api/v2/system_group'

module JumpCloud
  extend ActiveSupport::Autoload

  # autoload :JumpCloud

  class << self
    attr_writer :logger
    attr_accessor :config

    DEFAULT_CONFIG = {
      api_key: ENV['JUMPCLOUD_API_KEY'],
      connect_key: ENV['JUMPCLOUD_CONNECT_KEY'],
      install_sudo: false,
      install_command: :curl,
      log_level: :warn
    }

    def self.root(*args)
      (@root ||= Pathname.new(File.expand_path('../', __dir__))).join(*args)
    end

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
        log.level = JumpCloud.config.log_level
      end
    end

    def reset_config
      @config = OpenStruct.new(DEFAULT_CONFIG)
    end

    def configure
      yield(config)
    end
  end

  reset_config
end

# def safeload(paths)
#   paths.delete_if do |path|
#     begin
#       require(path)
#       true
#     rescue NameError => e
#       false
#     end
#   end
# end

# f = safeload Dir[__dir__ + '/../app/api/**/*.rb']
# safeload f

JC = JumpCloud
