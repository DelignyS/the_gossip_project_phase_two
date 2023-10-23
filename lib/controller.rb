# On commence par importer le fichier Gossip.rb, qui contient la classe Gossip que nous avons définie précédemment.
require 'gossip'

# Ensuite, on définit un contrôleur (controller) nommé ApplicationController en utilisant la bibliothèque Sinatra.
class ApplicationController < Sinatra::Base
    # Cette route correspond à la page d'accueil, qui affiche tous les potins.
    get '/' do
        # On utilise la méthode Gossip.all pour récupérer tous les potins et on les stocke dans une variable gossips.
        erb :index, locals: { gossips: Gossip.all }
    end
    
    # Cette route correspond à la page de création d'un nouveau potin.
    get '/gossips/new' do 
        erb :new_gossip
    end

    # Cette route est une route dynamique qui permet d'afficher un potin spécifique en fonction de son ID.
    get '/gossips/:id' do
      # On récupère l'ID du potin depuis les paramètres de l'URL et on le convertit en entier.
      id = params[:id].to_i
      # On utilise la méthode Gossip.all pour récupérer tous les potins, puis on sélectionne celui qui correspond à l'ID.
      @potin = Gossip.all[id]
      erb :show
    end

    # Cette route gère la soumission du formulaire de création d'un potin.
    post '/gossips/new' do
      author = params[:gossip_author]
      content = params[:gossip_content]
    
      # On vérifie si l'auteur ou le contenu est vide. Si l'un d'entre eux est vide, on redirige vers le formulaire de création.
      if author.empty? || content.empty?
        redirect '/gossips/new'  # Redirection vers le formulaire de création
      else
        # Si les champs ne sont pas vides, on crée un nouvel objet Gossip avec les données de l'auteur et du contenu.
        gossip = Gossip.new(author, content)
        # On sauvegarde le potin dans le fichier CSV.
        gossip.save
        # Enfin, on redirige l'utilisateur vers la page d'accueil.
        redirect '/'
      end
    end
end