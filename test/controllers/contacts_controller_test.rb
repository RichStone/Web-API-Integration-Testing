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

  test "should show contact" do
    get contact_url(@contact), as: :json
    parsed_response = JSON.parse(response.body)

    assert_response :success
    assert_equal @contact.id, parsed_response["id"]
    assert_equal @contact.email_address, parsed_response["email_address"]
    assert_equal @contact.first_name, parsed_response["first_name"]
    assert_equal @contact.last_name, parsed_response["last_name"]
    assert_equal @contact.nick, parsed_response["nick"]
    assert_equal @contact.age, parsed_response["age"]
    assert_equal @contact.updated_at.as_json, parsed_response["updated_at"]
    assert_equal @contact.created_at.as_json, parsed_response["created_at"]
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
