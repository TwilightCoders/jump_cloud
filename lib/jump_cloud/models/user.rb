module JumpCloud
  class User < V1::Model
    primary_key :_id
    has_many :associations, class_name: 'JumpCloud::User::Association'
    has_many :systems
  end
end
