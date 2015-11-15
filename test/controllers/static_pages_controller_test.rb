require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "Artisto"
  end
  
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title" , "#{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title" , "Help | #{@base_title}"
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
    assert_select "title" , "Contact Us | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title" , "About | #{@base_title}"
  end

  test "should get advice" do
    get :advice
    assert_response :success
    assert_select "title" , "Advice | #{@base_title}"
  end

  test "should get search_result" do
    get :search_result
    assert_response :success
    assert_select "title" , "Search Results | #{@base_title}"
  end

end
