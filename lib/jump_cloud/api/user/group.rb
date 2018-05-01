module JumpCloud
  class User
    class Group < ::JumpCloud::Group
      collection_path "usergroups"
      # attributes :id, :name

      belongs_to :user

      proxy :V2, JumpCloud::V2::API
    end
  end
end
