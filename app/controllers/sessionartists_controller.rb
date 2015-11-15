class SessionartistsController < ApplicationController
  def new
  end
  
   
  def create
    artist = Artist.find_by(email: params[:session][:email].downcase)
    if artist && artist.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      login_artist artist
      #remember artist
      redirect_back_or artist

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end



  def destroy
    
    logout_artist if logged_in_artist?
    redirect_to root_url
  end

end
