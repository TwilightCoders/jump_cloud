module JumpCloud
  class System
    class Association < ::JumpCloud::Association
      collection_path "/v2/systems/:system_id/associations"

      belongs_to :group
      belongs_to :system

    end
  end
end
