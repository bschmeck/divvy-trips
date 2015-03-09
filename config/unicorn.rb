preload_app true
worker_processes [ENV['UNICORN_THREADS'].to_i, 1].max # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection

  Signal.trap "TERM" do
    puts 'Unicorn worker intercepting TERM and doing nothing. Waiting for master to send QUIT'
  end
end
