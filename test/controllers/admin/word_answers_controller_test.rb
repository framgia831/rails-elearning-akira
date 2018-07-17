require 'test_helper'

class Admin::WordAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_word_answers_new_url
    assert_response :success
  end

end
