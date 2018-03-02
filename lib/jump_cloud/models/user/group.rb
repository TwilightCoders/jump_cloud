module JumpCloud
  class User
    class Group < ::JumpCloud::Group
      collection_path "usergroups"
      # attributes :id, :name

    end
  end
end
