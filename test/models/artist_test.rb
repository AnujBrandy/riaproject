require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @artist = Artist.new(name: "Example Artist", email: "artist@example.com" , name: "MyString" ,
  email: "MyString@gmail.com",
  password: "MyString",
  gravatar_url: "MyString",
  description: "MyText",
  skill: "MyString",
  experience: 1,
  facebook_url: "MyString",
  twitter_url: "MyString",
  contact_no: "MyString",
  address: "MyText",
  country: "MyString",
  state: "MyString",
  city: "MyString",
  availability: "MyString",
  youtube_url: "MyString",
  behance_url: "MyString",
  facebook_page: "MyString",
  blog_url: "MyString",
  website_url: "MyString" ,
  other_url: "MyString",
  motto_line: "MyText"
)
  end

  test "should be valid" do
    assert @artist.valid?
  end
  
  test "name should be present" do
    @artist.name = "     "
    assert_not @artist.valid?
  end
  
  test "email should be present" do
    @artist.email = "     "
    assert_not @artist.valid?
  end
  
  test "name should not be too long" do
    @artist.name = "a" * 100
    assert_not @artist.valid?
  end

  test "email should not be too long" do
    @artist.email = "a" * 244 + "@example.com"
    assert_not @artist.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[artist@example.com ARTIST@foo.COM A_ART-IST@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @artist.email = valid_address
      assert @artist.valid?, "#{valid_address.inspect} should be valid"
    end
    
    test "email validation should reject invalid addresses" do
    invalid_addresses = %w[artist@example,com user_at_foo.org artist.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @artist.email = invalid_address
      assert_not @artist.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @artist.dup
    duplicate_user.email = @artist.email.upcase
    @artist.save
    assert_not duplicate_artist.valid?
  end

  test "password should be present (nonblank)" do
    @artist.password = @artist.password_confirmation = " " * 6
    assert_not @artist.valid?
  end

  test "password should have a minimum length" do
    @artist.password = @artist.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
