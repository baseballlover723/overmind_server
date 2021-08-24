require "kemal"

require "./overmind_server"

get "/version" do
  OvermindServer::VERSION
end
  
Kemal.run
