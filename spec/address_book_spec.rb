require_relative '../models/address_book.rb'

describe AddressBook do
  context "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end
    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq 0
    end
  end

  context "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')

      expect(book.entries.size).to eq 1
    end
    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Miguel Canas'
      expect(new_entry.phone_number).to eq '(617) 599-3901'
      expect(new_entry.email).to eq 'mcanas@localytics.com'
    end
  end

  context "#remove_entry" do
    it "removes only one entry from the address book" do
      book = AddressBook.new
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(book.entries.size).to eq 1

      book.remove_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(book.entries.size).to eq 0
    end
    it "removes the correct entry from the address book" do
      book = AddressBook.new
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas1981@gmail.com')
      book.remove_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')

      entry = book.entries[0]
      expect(entry.email).to eq 'mcanas1981@gmail.com'
    end
  end
end
