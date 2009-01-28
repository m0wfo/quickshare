require 'optparse'

module Share
  class CLI
    def self.execute(stdout, arguments=[])

      options = {
        :port     => 9999,
        :share_name => "Sharing #{Dir.pwd.split('/').last} on #{Socket.gethostname}"
      }
      mandatory_options = %w(  )

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^          /,'')

          Usage: #{File.basename($0)} [options]

          Options are:
        BANNER
        opts.separator ""
        opts.on("-p", "--port=PORT", Integer,
                "Specify which port to listen on.",
                "Default: 9999") { |arg| options[:port] = arg }
        opts.on("-s", "--share=SHARENAME", String,
                "Specify a name to identify this share.",
                "Default: 'Sharing {PWD} on {HOSTNAME}'") { |arg| options[:share_name] = arg }
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
        :DocumentRoot    => Dir.pwd
      )
      
      s.mount("/",WEBrick::HTTPServlet::FileHandler, Dir::pwd, true)
      broadcast = Thread.new {system("dns-sd -R '#{share_name}' _http._tcp . #{port} path=/")}
      
      trap("INT"){ broadcast.terminate; s.shutdown; exit! }
      s.start
      
      while true do
        sleep 1
      end
    end
  end
end