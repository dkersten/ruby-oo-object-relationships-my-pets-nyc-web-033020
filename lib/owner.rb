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

  def cats
    #return all of the specific owner's cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    #return all of the specific owner's dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    #all.count --> all. and self.all. is interchangeable here
    self.all.count
  end

  def self.reset_all
    #all.count --> all. and self.all. is interchangeable here
    self.all.clear
  end
end