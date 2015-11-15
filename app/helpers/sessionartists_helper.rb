module SessionartistsHelper
  def login_artist(artist)
    session[:artist_id] = artist.id
  end
  
  # Forgets a persistent session.
  
  # Returns the user corresponding to the remember token cookie.
  def current_artist
    if (artist_id = session[:artist_id])
      @current_artist ||= Artist.find_by(id: artist_id)
    elsif (user_id = cookies.signed[:artist_id])
      
      artist = Artist.find_by(id: artist_id)
      if artist && artist.authenticated?(cookies[:remember_token])
        login_artist artist
        @current_artist = artist
      end
    end
  end


  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  
  # Returns true if the given user is the current user.
  def current_artist?(artist)
    artist == current_artist
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in_artist?
    !current_artist.nil?
  end
  
  # Remembers a user in a persistent session.

  # Logs out the current user.
  def logout_artist
    session.delete(:artist_id)
    @current_artist = nil
  end

end

