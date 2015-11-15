class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gravatar_url
      t.text :description
      t.string :skill
      t.integer :experience
      t.string :facebook_url
      t.string :twitter_url
      t.string :contact_no
      t.text :address
      t.string :country
      t.string :state
      t.string :city
      t.string :availability
      t.string :youtube_url
      t.string :behance_url
      t.string :facebook_page
      t.string :blog_url
      t.string :website_url
      t.string :other_url
      t.text :motto_line

      t.timestamps null: false
    end
  end
end
