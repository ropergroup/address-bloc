require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) {AddressBook.new}

 describe "attributes" do
   it "responds to entries" do
     expect(book).to respond_to(:entries)
   end

   it "initializes entries as an array" do
        expect(book.entries).to be_an(Array)
      end

      it "initializes entries as empty" do
        expect(book.entries.size).to eq(0)
      end
    end

  end

  describe "#delete_entry" do
    it "removes an entry using the name, phone_number, and email" do
      book.delete_entry("Michael Faraday", "010.210.5181", "michael.faraday@faraday.com")

      name = "Ada Lovelace"
      phone_number = "010.012.1815"
      email = "augusta.king@lovelace.com"
      book.add_entry(name, phone_number, email)

      expect(book.entries.size).to eq(2)
      book.delete_entry(name, phone_number, email)
      expect(book.entries.size).to eq(1)
      expect(book.entries.first.name).to eq("Michael Faraday")
  end

  describe "#add_entry" do
     it "adds only one entry to the address book" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

       expect(book.entries.size).to eq(1)
     end

     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]

       expect(new_entry.name).to eq('Ada Lovelace')
       expect(new_entry.phone_number).to eq('010.012.1815')
       expect(new_entry.email).to eq('augusta.king@lovelace.com')
     end
   end

   describe "#import_from_csv" do
     it "imports the correct number of entries" do
       book.import_from_csv("entries.csv")
       book_size = book.entries.size
       expect(book_size).to eq 5
     end
   end
 end
