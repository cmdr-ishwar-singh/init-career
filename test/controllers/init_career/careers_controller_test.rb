require 'test_helper'

module InitCareer
  class CareersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @career = init_career_careers(:one)
    end

    test "should get index" do
      get careers_url
      assert_response :success
    end

    test "should get new" do
      get new_career_url
      assert_response :success
    end

    test "should create career" do
      assert_difference('Career.count') do
        post careers_url, params: { career: { description: @career.description, location: @career.location, position: @career.position, questions: @career.questions, status: @career.status, title: @career.title } }
      end

      assert_redirected_to career_url(Career.last)
    end

    test "should show career" do
      get career_url(@career)
      assert_response :success
    end

    test "should get edit" do
      get edit_career_url(@career)
      assert_response :success
    end

    test "should update career" do
      patch career_url(@career), params: { career: { description: @career.description, location: @career.location, position: @career.position, questions: @career.questions, status: @career.status, title: @career.title } }
      assert_redirected_to career_url(@career)
    end

    test "should destroy career" do
      assert_difference('Career.count', -1) do
        delete career_url(@career)
      end

      assert_redirected_to careers_url
    end
  end
end
