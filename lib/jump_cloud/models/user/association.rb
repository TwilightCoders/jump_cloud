module JumpCloud
  class User
    class Association < ::JumpCloud::Association
      collection_path "/usergroups/:id"
    end
  end
end
