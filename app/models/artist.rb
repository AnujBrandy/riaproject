class Artist < ActiveRecord::Base
    attr_accessor :remember_token
    
    before_save { self.email = email.downcase }
    validates :name, length: { maximum: 100 } , presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, length: { maximum: 250 } , presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    #validates :password, length: { maximum: 100 } , presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :gravatar_url, length: { maximum: 2083 }
    validates :description, length: { maximum: 200 } 
    
    validates :skill, length: { maximum: 200 } 
    validates :experience, length: { maximum: 200 }
 
    validates :facebook_url, length: { maximum: 2083 }
    validates :twitter_url, length: { maximum: 2083 }
    validates :contact_no, length: { maximum: 15 }
    validates :address, length: { maximum: 300 }
    validates :country, length: { maximum: 100 }
    validates :state, length: { maximum: 100 }
    validates :city, length: { maximum: 100 }
    validates :availability, length: { maximum: 100 }
    validates :youtube_url, length: { maximum: 2083 }
    validates :behance_url, length: { maximum: 2083 }
    validates :facebook_page, length: { maximum: 2083 }
    validates :blog_url, length: { maximum: 2083 }
    validates :website_url, length: { maximum: 2083 }
    validates :other_url, length: { maximum: 2083 }
    validates :motto_line, length: { maximum: 200 }
    
    # Returns the hash digest of the given string.
  def Artist.digest(string)
  end
  
  # Returns a random token.
  def Artist.new_token
  end
  
  # Remembers a user in the database for use in persistent sessions.
  #def remember
   # self.remember_token = Artist.new_token
    #update_attribute(:remember_digest, Artist.digest(remember_token))
  #end
  
end
