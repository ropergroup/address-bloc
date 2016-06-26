require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all Entries"
    puts "2 - Create an Entry"
    puts "3 - Search for an Entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your Selection: "

    selection = gets.to_i
    puts "You picked #{selection}"
  end
end
