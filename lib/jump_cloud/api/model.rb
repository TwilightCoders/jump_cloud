module JumpCloud
  class Model
    include Her::Model

    def self.proxy(namespace, api)
      klass = Class.new(self) do |klass|
        use_api api

        def self.instantiate_record(klass, parsed_data)
          super(klass.superclass, parsed_data)
        end

      end
      const_set(namespace, klass)
    end
  end
end
