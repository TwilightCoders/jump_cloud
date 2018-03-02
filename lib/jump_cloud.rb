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


module JumpCloud
  extend ActiveSupport::Autoload

  autoload :JumpCloud

  class << self
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
        log.level = JumpCloud.config.log_level
      end
    end
  end
end

def safeload(paths)
  paths.delete_if do |path|
    begin
      require(path)
      true
    rescue NameError => e
      false
    end
  end
end

f = safeload Dir[__dir__ + '/../app/models/**/*.rb']
safeload f

JC = JumpCloud
