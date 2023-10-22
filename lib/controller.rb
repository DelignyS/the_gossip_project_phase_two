require 'bundler'
Bundler.require

class ApplicationController < Sinatra::Base
  get '/' do
    "<title>The Gossip Project</title>\n\nMon super site de gossip !"
  end

  run! if app_file == $0
end