class CLI
  PEOPLE = [
    {name: "Cernan", age: 100},
    {name: "Ashley", age: 50},
    {name: "Daisy", age: 2},
  ]

  def run
    Person.seed_people(PEOPLE)
    welcome
    menu
  end

  def list_instructions
    puts "What would you like to do?"
    puts "1. Create a person"
    puts "2. List all the people"
    puts "3. Remane a person"
    puts "4. Exit"
  end

  def menu
    input = nil
    while input != "4"
      list_instructions
      input = gets.strip
      case input
      when "1"
        create_person_menu
      when "2"
        list_people
      when "4"
        puts "Shutting down...Goodbye!"
      end
      puts ""
      sleep(1)

    end
  end

  def create_person_menu
    puts "What is this person's name?"
    name = gets.strip
    puts "How old is this person?"
    age = gets.strip.to_i

    person = Person.new({name: name, age: age})

  end

  def list_people
    Person.all.each do |p|
      puts p.name
    end
  end

  def welcome
    puts "Welcome to people creator"
  end
end