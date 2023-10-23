require "csv"

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if index == id
        return csv_line
      end
    end
  end
end # End of class - "Gossip"
# End of file - "gossip.rb"
