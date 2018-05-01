module JumpCloud
  class System < V1::Model
    has_many :groups, class_name: 'System::Group', path: '/memberof'

    has_many :associations, class_name: 'System::Association'

    has_many :users
  end
end
