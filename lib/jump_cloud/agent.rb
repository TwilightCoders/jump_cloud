module JumpCloud
  module Agent

    class << self
      def install(fetch: :curl)
        if system(install_cmd(fetch))
          puts "Agent installed"
        else
          puts "Agent not installed. Check /opt/jc/jcagentInstall.log"
          puts `cat /opt/jc/jcagentInstall.log`
        end
      end

      def system_id
        config['systemKey']
      end

      def config_file
        "/opt/jc/jcagent.conf"
      end

      def config(cache: true)
        @config = (cache ? @config : false) || JSON.parse( IO.read(config_file) )
      rescue JSON::ParserError => e
        warn "Malformed config in #{config_file}"
        {}
      rescue StandardError => e
        {}
      end

      def install_cmd(fetch)
        kick_start_url = "https://kickstart.jumpcloud.com/Kickstart"
        case fetch
        when :curl
          curl_flags = "--silent --show-error"
          curl_headers = "--header 'x-connect-key: #{JumpCloud.config.connect_key}'"
          exe = JumpCloud.config.install_sudo ? "sudo bash" : "bash"
          "curl #{curl_flags} #{curl_headers} #{kick_start_url} | #{exe}"
        else
          fail "Not supported"
        end
      end
    end

  end
end
