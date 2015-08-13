require_relative '../models/entry.rb'

describe Entry do
  context "attributes" do
    it "should respond to name" do
      entry = Entry.new('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(entry).to respond_to(:name)
    end
    it "should respond to phone number" do
      entry = Entry.new('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(entry).to respond_to(:phone_number)
    end
    it "should respond to email" do
      entry = Entry.new('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expect(entry).to respond_to(:email)
    end
  end
  context "#to_s" do
    it "prints an entry as a string" do
      entry = entry = Entry.new('Miguel Canas', '(617) 599-3901', 'mcanas@localytics.com')
      expected_string = "Name: Miguel Canas\nPhone Number: (617) 599-3901\nEmail: mcanas@localytics.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
