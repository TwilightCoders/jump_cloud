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
require 'jump_cloud/models/v1/model'
require 'jump_cloud/models/v2/model'

require 'jump_cloud/models/user'
require 'jump_cloud/models/system'
require 'jump_cloud/models/group'
require 'jump_cloud/models/association'

require 'jump_cloud/models/user/association'
require 'jump_cloud/models/user/group'

require 'jump_cloud/models/system/association'
require 'jump_cloud/models/system/group'

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

# f = safeload Dir[__dir__ + '/../app/models/**/*.rb']
# safeload f

JC = JumpCloud
