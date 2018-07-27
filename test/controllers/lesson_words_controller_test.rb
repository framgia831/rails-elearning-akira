require 'test_helper'

class LessonWordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lesson_words_index_url
    assert_response :success
  end

end
