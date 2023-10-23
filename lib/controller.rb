require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: { gossips: Gossip.all }
    end
    
    get '/gossips/new' do 
        erb :new_gossip
    end

    get '/gossips/:id' do
      id = params[:id].to_i
      @potin = Gossip.all[id]
      erb :show
    end
    post '/gossips/new' do
      author = params[:gossip_author]
      content = params[:gossip_content]
    
      if author.empty? || content.empty?
        redirect '/gossips/new'  #vers le formulaire de création
      else
        gossip = Gossip.new(author, content)
        gossip.save
        redirect '/'
      end
    end

end