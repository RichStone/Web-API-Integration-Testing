require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  let(:contact) {
    Contact.create!(
      email_address: "MyString",
      first_name: "MyString",
      last_name: "MyString",
      age: 1
    )
  }

  before(:each) do
    assign(:contact, contact)
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(contact), "post" do

      assert_select "input[name=?]", "contact[email_address]"

      assert_select "input[name=?]", "contact[first_name]"

      assert_select "input[name=?]", "contact[last_name]"

      assert_select "input[name=?]", "contact[age]"
    end
  end
end
