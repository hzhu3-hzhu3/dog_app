require "test_helper"

class DogImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dog_images_show_url
    assert_response :success
  end
end
