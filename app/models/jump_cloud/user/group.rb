require 'jump_cloud/user'
module JumpCloud
  class User
    class Group < ::JumpCloud::Group
      collection_path "usergroups"
      # attributes :id, :name

      type "user_group"
    end
  end
end
