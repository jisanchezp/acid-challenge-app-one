require 'test_helper'
require 'faker'

class LoginsControllerTest < ActionDispatch::IntegrationTest
  include Base64Helper

  setup do
    @uploaded_file =  Rack::Test::UploadedFile.new (Rails.root.join("test/files/test.png")), 'image/png'
    @login = Login.new(email: Faker::Internet.free_email, image: @uploaded_file)
    @user_agent = Faker::Internet.user_agent
    @url = "http://localhost:3002/rest/login"
    @request_body = { email: @login.email, image: file_to_url_safe_base64(@uploaded_file) }.to_json
    @request_headers =  {
                          'Content-Type' => 'application/json',
                          'User-Agent' => @user_agent
                        }
    @authorized_response_body = { message: "OK" }.to_json
    @unauthorized_response_body = { message: "No Autorizado" }.to_json
  end

  test "should get new" do
    get root_path
    assert_response :success
  end

  test "should get 401" do
    stub_request(:post, @url)
      .with(
        body: @request_body,
        headers: @request_headers
      )
      .to_return(
        status: [401, "No Autorizado"],
        body: @unauthorized_response_body,
        headers: {})

    post logins_path, params: {
                                login: {
                                  email: @login.email,
                                  image: @login.image
                                }
                              },
                              headers: {'User-Agent' => @user_agent}

    assert_response 401
    assert_equal @unauthorized_response_body, @response.body
  end
end
