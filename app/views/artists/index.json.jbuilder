json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :email, :password, :gravatar_url, :description, :skill, :experience, :facebook_url, :twitter_url, :contact_no, :address, :country, :state, :city, :availability, :youtube_url, :behance_url, :facebook_page, :blog_url, :website_url, :other_url, :motto_line
  json.url artist_url(artist, format: :json)
end
