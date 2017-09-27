class Contact
  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  # Reader instance methods
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  # Writer instance methods
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    # solution 1
    # @@contacts.each do |contact|
    #   if contact.id == id
    #     return contact
    #   end
    # end

    # solution 2
    @@contacts.find do
      |contact| contact.id == id
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    valid_selection = false
    options = [1, 2, 3, 4]

    while valid_selection == false
      puts "Which contact attribute would you like to update?"
      puts "[ 1 ] First name"
      puts "[ 2 ] Last name"
      puts "[ 3 ] Email"
      puts "[ 4 ] Note"
      attribute = gets.to_i

      if options.include?(attribute)
        valid_selection = true
      else
        puts "Invalid selection, please try again."
      end
    end

    puts "What would you like to new value to be?"
    new_value = gets.chomp

    if attribute == 1
      self.first_name = new_value
    elsif attribute == 2
      self.last_name = new_value
    elsif attribute == 3
      self.email = new_value
    else
      self.note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

new_contact = Contact.create("Cece", "Wong", "cece@gmail.com", "likes kittens")
new_contact_2 = Contact.create("Jane", "Gomez", "janey@gmail.com", "is a writer")
new_contact_3 = Contact.create("Brett", "Cecil", "brett@gmail.com", "plays baseball")

new_contact_2.delete
puts Contact.all.inspect
