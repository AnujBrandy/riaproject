require 'test_helper'

class ArtistsSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_artists_path
    assert_no_difference 'Artist.count' do
      post artists_path, artist: { name:  "",
                               email: "artist@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'artists/new'
  end
  
  test "valid signup information" do
    get signup_artists_path
    assert_difference 'Artist.count', 1 do
      post_via_redirect artists_path, artist: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'artists/show'
  end


end
