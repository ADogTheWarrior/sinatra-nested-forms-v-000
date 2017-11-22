class Ship
  attr_accessor :name, :type, :booty
  @@all = []

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end
end
