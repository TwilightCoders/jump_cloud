module JumpCloud
  module Agent

    def self.config_file
      "/opt/jc/jcagent.conf"
    end

    def self.config
      @config ||= JSON.parse( IO.read(config_file) )
    rescue StandardError => e
      {}
    end

  end
end
