require "csv"

class Gossip
  attr_accessor :author, :content, :id

  def initialize(author, content, id = nil)
    @content = content
    @author = author
    @id = id || Gossip.next_id
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content, @id]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1], csv_line[2].to_i)
    end
    all_gossips
  end

  def self.next_id
    # Lire le fichier CSV et trouver le dernier ID utilisé
    last_id = CSV.read("./db/gossip.csv").map { |row| row[2].to_i }.max || 0
    # Ajouter 1 pour le prochain ID
    last_id + 1
  end

  def self.find(id)
    CSV.read("./db/gossip.csv").each do |csv_line|
      if csv_line[2].to_i == id
        gossip = Gossip.new(csv_line[0], csv_line[1], csv_line[2].to_i)
        return gossip
      end
    end
    nil
  end
end # End of class - "Gossip"
# End of file - "gossip.rb"
