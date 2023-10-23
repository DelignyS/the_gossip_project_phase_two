require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: { gossips: Gossip.all }
    end
    
    get '/gossips/new' do 
        erb :new_gossip
    end

    get '/gossips/:id' do
        index = params[:id].to_i
        @gossip = Gossip.all[index]
        erb :show
    end

    get '/gossips/:id/edit' do
        index = params[:id].to_i
        @gossip = Gossip.all[index]
        erb :edit
    end

    post '/gossips/new' do
      author = params[:gossip_author]
      content = params[:gossip_content]
    
      if author.empty? || content.empty?
        # Si l'un des champs est vide, tu peux rediriger l'utilisateur ou afficher un message d'erreur.
        redirect '/gossips/new'  # Redirige l'utilisateur vers le formulaire de création
      else
        gossip = Gossip.new(author, content)
        gossip.save
        redirect '/'
      end
    end

    post '/gossips/:id/edit' do
        index = params[:id].to_i
        @gossip = Gossip.all[index]      
        @gossip.content = params[:content].to_s   
        Gossip.update(index, @gossip.content)      
        redirect '/'
    end      
end