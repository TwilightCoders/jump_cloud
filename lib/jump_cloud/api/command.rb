module JumpCloud
  class Command < V2::Model

    has_many :associations
    has_many :systems

    has_many :system_groups, class_name: 'System::Group', path: 'commands/:id/systemgroups'

  end
end
