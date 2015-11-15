class User < ActiveRecord::Base
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 } ,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    
    # Returns the hash digest of the given string.
  def User.digest(string)
  end
  
  # Returns a random token.
  def User.new_token
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
  end
  
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  end


  # Forgets a user.
  def forget
  end

  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  end


end
