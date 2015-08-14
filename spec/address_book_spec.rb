require_relative '../models/address_book.rb'

describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_phone, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_phone
    expect(entry.email).to eq expected_email
  end

  context "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end
    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end
    it "should initialize entries as empty" do
      expect(book.entries.size).to eq 0
    end
  end

  context "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')

      expect(book.entries.size).to eq 1
    end
    it "adds the correct information to entries" do
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq 'Miguel Canas'
      expect(new_entry.phone_number).to eq '(617) 599-3901'
      expect(new_entry.email).to eq 'mcanas@localytics.com'
    end
  end

  context "#remove_entry" do
    it "removes only one entry from the address book" do
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(book.entries.size).to eq 1

      book.remove_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(book.entries.size).to eq 0
    end
    it "removes the correct entry from the address book" do
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      book.add_entry('Miguel Canas', '(617) 599-3901', 'mcanas1981@gmail.com')
      book.remove_entry('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')

      entry = book.entries[0]
      expect(entry.email).to eq 'mcanas1981@gmail.com'
    end
  end

  context "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq 5
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[0], "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      check_entry(book.entries[4], "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
  end
end
