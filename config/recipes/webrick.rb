namespace :webrick do

  %w[start stop restart].each do |command|
    task command, roles: :web do
      case command
      when 'start'
        cluster_ports.each { |port|
          pidpath = "#{shared_path}/pids/#{port}.pid"
          puts "Starting WEBrick at port #{port} on #{bind_ip} as deamon"
          run "cd #{current_path}; rails server -d -p #{port} -b #{bind_ip} --environment=production --pid=#{pidpath}"
        }
      when 'stop'
        cluster_ports.each { |port|
          begin
            pidpath = "#{shared_path}/pids/#{port}.pid"
            run "kill -9 `cat #{pidpath}`"
          rescue => e
            # try to kill with ps
            puts "COULDN'T KILL THROUGH PIDFILE #{e.inspect}"
          end
        }
      when 'restart'
        stop
        start
      else
        puts "UNKNOWN command: '#{command}'"
      end
    end
  end
  after "deploy:restart", "webrick:restart"
  after "deploy:cold", "webrick:start"

end