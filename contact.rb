gem "activerecord", "4.2.7"
require "active_record"
require "mini_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  def full_name
    "#{ first_name } #{ last_name }"
  end

end

# new_contact = Contact.create("Cece", "Wong", "cece@gmail.com", "likes kittens")
# new_contact_2 = Contact.create("Jane", "Gomez", "janey@gmail.com", "is a writer")
# new_contact_3 = Contact.create("Brett", "Cecil", "brett@gmail.com", "plays baseball")
#
# puts Contact.all.inspect
# new_contact.update
# puts new_contact.inspect
