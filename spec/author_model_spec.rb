require "spec_helper"

describe Author do
  before(:each) do
    Author.create(first_name: "Keiran", last_name: "Smith", email: "affix@affix.me", password: "AffixPassw0rd", password_confirmation: "AffixPassw0rd", username: "Affix")
    Author.create(first_name: "Mark", last_name: "Billie", email: "mark@affix.me", password: "MarkPassw0rd", password_confirmation: "MarkPassw0rd", username: "mbillie")
  end

  it "Adds Authors" do
    Author.create(first_name: "Joe", last_name: "Bloggs", email: "jbloggs@affix.me", password: "JoeBloggsPassw0rd", password_confirmation: "JoeBloggsPassw0rd", username: "jbloggs") # A Secure Pass Right?
    Author.count.should eq 3
  end

  it "Should not add with password missmatch" do
    a = Author.create(first_name: "Joe", last_name: "Bloggs", email: "jbloggs@affix.me", password: "JoeBloggsPassw0rd", password_confirmation: "ThisPassDoesntMatch", username: "jbloggs")
    a.errors[:password_confirmation].first.should eq "doesn't match Password"
    Author.count.should eq 2
  end

  it "Should reject an invalid email" do
    a = Author.create(first_name: "Joe", last_name: "Bloggs", email: "ThisIsntAnEmail", password: "JoeBloggsPassw0rd", password_confirmation: "JoeBloggsPassw0rd", username: "jbloggs")
    a.errors[:email].first.should eq "doesn't look like an email address"
    Author.count.should eq 2
  end

  it "Should not allow duplicate users or email" do
    a = Author.create(first_name: "Keiran", last_name: "Smith", email: "affix@affix.me", password: "AffixPassw0rd", password_confirmation: "AffixPassw0rd", username: "joe")
    a.errors[:email].first.should eq "has already been taken"
    a = Author.create(first_name: "Keiran", last_name: "Smith", email: "affix@affix.ame", password: "AffixPassw0rd", password_confirmation: "AffixPassw0rd", username: "Affix")
    a.errors[:username].first.should eq "has already been taken"
    Author.count.should eq 2
  end

end