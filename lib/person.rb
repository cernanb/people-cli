class Person
  attr_accessor :name, :age

  @@all = []

  def initialize(person_hash)
    person_hash.each do |k, v|
      self.send("#{k}=", v)
    end

    @@all << self
  end

  def self.seed_people(people_arr)
    people_arr.each do |person_hash|
      self.new(person_hash)
    end
  end

  def self.all
    @@all
  end

end