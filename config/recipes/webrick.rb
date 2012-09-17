namespace :webrick do

  %w[start stop restart].each do |command|
    task command, roles: :web do
      case command
      when 'start'
        for port in cluster_ports
          pidpath = "#{shared_path}/pids/#{port}.pid"
          puts "Starting WEBrick at port #{port} on #{bind_ip} as deamon"
          run "cd #{current_path}; rails server -d -p #{port} -b #{bind_ip} --environment=production --pid=#{pidpath}"
        end
      when 'stop'
        for port in cluster_ports
          begin
            pidpath = "#{shared_path}/pids/#{port}.pid"
            run "kill -9 `cat #{pidpath}`"
          rescue => e
            # try to kill with ps
            puts "COULDN'T KILL THROUGH PIDFILE #{e.inspect}"
          end
        end
      when 'restart'
        stop
        start
      end
    end
  end
  after "deploy:restart", "webrick:restart"
  after "deploy:cold", "webrick:start"

end