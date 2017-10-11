class Person
  attr_accessor :name, :age

  @@all = []

  def initialize(person_hash)
    person_hash.each do |k, v|
      binding.pry
      self.send("#{k}")
    end
    save
  end

  def self.seed_people(people_arr)
    people_arr.each do |person_hash|
      self.new(person_hash)
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def change_name(new_name)
    self.name= new_name
  end

  def have_birthday
    self.age += 1
  end

  def self.old_people
    #return all of the person objects that are age 80 or older
    self.all.select { |p| p.age > 80 }.sort {|a, b| b.age - a.age}
  end

end