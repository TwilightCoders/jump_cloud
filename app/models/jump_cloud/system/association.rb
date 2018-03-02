require 'jump_cloud/user'
module JumpCloud
  class System
    class Association < ::JumpCloud::Association
      collection_path "/v2/systems/:system_id/associations"
    end
  end
end
