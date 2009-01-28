require 'optparse'

module Share
  class CLI
    def self.execute(stdout, arguments=[])

      options = {
        :port     => 9999,
        :share_name => "Quickshare"
      }
      mandatory_options = %w(  )

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')
          This application is wonderful because...

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        opts.on("-p", "--port=PORT", Integer,
                "Specify which port to listen on.",
                "Default: 9999") { |arg| options[:port] = arg }
        opts.on("-s", "--share=SHARENAME", String,
                "Specify a name to identify this share.",
                "Default: 'Quickshare'") { |arg| options[:share_name] = arg }
        opts.on("-h", "--help",
                "Show this help message.") { stdout.puts opts; exit }
        opts.parse!(arguments)

        if mandatory_options && mandatory_options.find { |option| options[option.to_sym].nil? }
          stdout.puts opts; exit
        end
      end

      port = options[:port]
      share_name = options[:share_name]

      # The magic starts here.
      s = WEBrick::HTTPServer.new(
        :Port            => port,
        :DocumentRoot    => Dir::pwd
      )
      
      handle = Net::DNS::MDNSSD.register(share_name, '_http._tcp', 'local', port, 'path' => '/')
      
      s.mount("/",WEBrick::HTTPServlet::FileHandler, Dir::pwd, true)
      
      trap("INT"){ s.shutdown; handle.stop; exit }
      s.start
      
      while true do
        sleep 1
      end
    end
  end
end