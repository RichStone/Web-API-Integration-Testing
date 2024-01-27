require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :success
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url, params: { contact: { age: @contact.age, email_address: @contact.email_address, first_name: @contact.first_name, last_name: @contact.last_name, nick: @contact.nick } }, as: :json
    end

    assert_response :created
  end

  test "#show responds with the serialized contact" do
    # Creating the contact in the test directly helps specifying requirements,
    # improving the tests-as-code state, and readability:
    contact = Contact.create(
      id: 0,
      email_address: "hey@richsteinmetz.com",
      first_name: "Rich",
      last_name: "Steinmetz",
      nick: "RichRich",
      age: 130,
      created_at: DateTime.parse("2024-01-27T15:51:05.981Z"),
      updated_at: DateTime.parse("2024-01-27T15:51:05.981Z")
    )
    get contact_url(contact), as: :json

    assert_response 200
    expected = {
      id: 0,
      email_address: "hey@richsteinmetz.com",
      first_name: "Rich",
      last_name: "Steinmetz",
      nick: "RichRich",
      age: 130,
      created_at: "2024-01-27T15:51:05.981Z",
      updated_at: "2024-01-27T15:51:05.981Z"
    }
    assert_equal expected.to_json, response.body
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { age: @contact.age, email_address: @contact.email_address, first_name: @contact.first_name, last_name: @contact.last_name, nick: @contact.nick } }, as: :json
    assert_response :success
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response :no_content
  end
end
