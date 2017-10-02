#to do
#add method to handle if id is not valid for modify and delete methods


require_relative "contact"

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[ 1 ] Add a new contact"
    puts "[ 2 ] Modify an existing contact"
    puts "[ 3 ] Delete a contact"
    puts "[ 4 ] Display all the contacts"
    puts "[ 5 ] Search by attribute"
    puts "[ 6 ] Exit"
    puts "Please enter a number: "
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    puts "Please enter in the following information for your new contact."
    puts "First name: "
    first_name = gets.chomp
    puts "Last name: "
    last_name = gets.chomp
    puts "Email: "
    email = gets.chomp
    puts "Note: "
    note = gets.chomp

    new_contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note)
    puts "New contact has been successfully added!"
  end

  def modify_existing_contact
    puts "Please enter in the id of the contact you'd like to modify: "
    search_id = gets.to_i

    if Contact.exists?(:id => search_id)
      puts "Which contact attribute would you like to update?"
      attribute = attribute_selection

      puts "What would you like to new value to be?"
      new_value = gets.chomp

      Contact.update(search_id, attribute => new_value)
      puts "Contact has been successfully updated!"
    else
      puts "No contact exists with an id of #{search_id}"
    end
  end

  def delete_contact
    puts "Please enter in the id of the contact you'd like to delete: "
    id = gets.to_i

    Contact.delete(id)
    puts "Contact has been successfully deleted!"
  end

  def display_all_contacts
    Contact.all.each do |contact|
      puts "Contact ID: #{contact.id}"
      puts "First name: #{contact.first_name}"
      puts "Last name: #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
    end

    puts "-- end of contact list --"
  end

  def search_by_attribute
    puts "Which contact attribute would you search by?"
    attribute = attribute_selection

    puts "What is the attribute value?"
    attribute_value = gets.chomp

    contact = Contact.find_by( attribute => attribute_value )

    if contact
      puts "The following contact has been found:"
      puts "Contact ID: #{contact.id}"
      puts "First name: #{contact.first_name}"
      puts "Last name: #{contact.last_name}"
      puts "Email: #{contact.email}"
      puts "Note: #{contact.note}"
    else
      puts "No contact was found."
    end
  end

  # validates attribute selection and converts it to a valid key name
  def attribute_selection
    valid_selection = false
    valid_options = [1, 2, 3, 4]
    puts "Please select an attribute by its number: "
    puts "[ 1 ] First name"
    puts "[ 2 ] Last name"
    puts "[ 3 ] Email"
    puts "[ 4 ] Note"

    while valid_selection == false
      attribute = gets.to_i
      if valid_options.include?(attribute)
        valid_selection = true
      else
        puts "Invalid selection, please try again."
      end
    end

    if attribute == 1
      attribute = :first_name
    elsif attribute == 2
      attribute = :last_name
    elsif attribute == 3
      attribute = :email
    else
      attribute = :note
    end

    return attribute
  end

end

# new_contact = Contact.create(
#   first_name: "Cece",
#   last_name: "Wong",
#   email: "cece@gmail.com",
#   note: "likes kittens")
# new_contact_2 = Contact.create("Jane", "Gomez", "janey@gmail.com", "is a writer")
# new_contact_3 = Contact.create("Brett", "Cecil", "brett@gmail.com", "plays baseball")

a_crm_app = CRM.new
a_crm_app.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
