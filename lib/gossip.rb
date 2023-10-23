# On commence par importer la bibliothèque CSV, qui nous permet de travailler avec des fichiers CSV.
require 'csv'

# Ensuite, on définit une classe appelée Gossip, qui sera utilisée pour représenter nos potins.
class Gossip
  # Les deux lignes suivantes créent deux attributs (variables) pour notre classe : author (auteur) et content (contenu).
  attr_accessor :author, :content

  # Le constructeur initialize est une méthode spéciale qui est appelée lorsqu'on crée une nouvelle instance de la classe.
  def initialize(author, content)
    # On attribue les valeurs passées en argument aux attributs de l'instance (l'objet).
    @content = content
    @author = author
  end

  # La méthode save permet de sauvegarder un potin dans un fichier CSV.
  def save
    # On ouvre le fichier "gossip.csv" en mode d'ajout ("a").
    # Cela signifie qu'on ajoutera de nouvelles lignes au fichier sans effacer les précédentes.
    CSV.open("./db/gossip.csv", "a") do |csv|
      # On ajoute les valeurs de l'auteur et du contenu du potin en tant que nouvelle ligne dans le fichier CSV.
      csv << [@author, @content]
    end
  end

  # La méthode self.all permet de récupérer tous les potins existants depuis le fichier CSV.
  def self.all
    # On crée un tableau vide pour stocker tous les potins.
    all_gossips = []

    # On lit le fichier CSV ligne par ligne.
    CSV.read("./db/gossip.csv").each do |csv_line|
      # Pour chaque ligne du CSV, on crée un nouvel objet Gossip en utilisant les valeurs de l'auteur et du contenu de la ligne.
      # Ensuite, on ajoute cet objet au tableau all_gossips.
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end

    # Enfin, on retourne le tableau complet des potins.
    return all_gossips
  end
end