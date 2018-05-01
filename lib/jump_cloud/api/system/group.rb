module JumpCloud
  class System
    proxy :V2, JumpCloud::V2::API

    class Group < ::JumpCloud::Group
      collection_path "systemgroups"
      # attributes :id, :name

      # type "system_group"
      has_many :systems, class_name: 'JumpCloud::System::V2', path: '/membership'
      has_many :users, class_name: 'JumpCloud::User::V2', path: '/users'
      # has_many :user_groups, class_name: 'JumpCloud::User::Group::V2', path: '/members'
    end
  end
end
