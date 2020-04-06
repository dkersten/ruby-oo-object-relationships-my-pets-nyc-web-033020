require 'pry'

class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    Owner.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
   end

   def buy_cat(name)
    Cat.new(name, self)
   end

   def buy_dog(name)
    Dog.new(name, self)
   end

   def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
   end

   def feed_cats
    self.cats.each do |cat| 
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    my_cats = self.cats.count
    my_dogs = self.dogs.count
    "I have #{my_dogs} dog(s), and #{my_cats} cat(s)."
  end

end