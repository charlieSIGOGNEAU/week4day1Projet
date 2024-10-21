

class Gossip
  def initialize(auther, content)
    @auteur=auther
    @content=content
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@auteur, @content]
    end
  end
end