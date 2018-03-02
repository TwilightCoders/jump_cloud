module JumpCloud
  class System < V1::Model

    has_many :groups, class_name: 'System::Group', path: 'systems/:id/memberof'

    has_many :users
  end
end
