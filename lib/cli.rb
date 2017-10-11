class CLI
  PEOPLE = [
    {name: "Cernan", age: 81},
    {name: "Ashley", age: 100},
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
    puts "3. Rename a person"
    puts "4. Age a person"
    puts "5. See all the old people"
    puts "'Exit' to exit"
  end

  def menu
    input = ""
    while input.downcase != "exit"
      list_instructions
      input = gets.strip
      case input
      when "1"
        create_person_menu
      when "2"
        list_people
      when "3"
        rename_person
      when "4"
        age_person
      when "5"
        display_old_people
      when "exit"
        puts "Shutting down...Goodbye!"
      end
      puts ""
      sleep(1)

    end
  end

  def display_old_people
    Person.old_people.each do |p|
      puts "#{p.name} - #{p.age} years old"
    end
  end

  def age_person
    puts "Which person do you want to age?"
    list_people

    input = gets.strip

    person = Person.all[input.to_i - 1]
    person.have_birthday
  end

  def rename_person
    puts "Which person do you want to rename?"
    list_people

    input = gets.strip

    person = Person.all[input.to_i - 1]
    puts "What is this person's new name?"
    new_name = gets.strip
    person.change_name(new_name)
  end

  def create_person_menu
    puts "What is this person's name?"
    name = gets.strip
    puts "How old is this person?"
    age = gets.strip.to_i

    person = Person.new({name: name, age: age})
  end

  def list_people
    Person.all.each.with_index(1) do |p, i|
      puts "#{i}. #{p.name} - #{p.age} years old"
    end
  end

  def welcome
    puts "Welcome to people creator"
  end
end