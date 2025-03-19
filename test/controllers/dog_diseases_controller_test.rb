require "test_helper"

class DogDiseasesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dog_diseases_show_url
    assert_response :success
  end
end
