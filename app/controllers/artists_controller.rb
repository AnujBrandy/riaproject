class ArtistsController < ApplicationController
  before_action :logged_in_artistt, only: [:index, :edit, :update , :destroy]
  before_action :correct_artist,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @artists = Artist.paginate(page: params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)    # Not the final implementation!
    if @artist.save
      # Handle a successful save.
      login_artist @artist
      flash[:success] = "Welcome to the Artisto!"
      redirect_to @artist
    else
      render 'new'
    end
  end
  

  def destroy
    Artist.find(params[:id]).destroy
    flash[:success] = "Artist deleted"
    redirect_to artists_url
  end
def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      flash[:success] = "Profile updated"
      redirect_to @artist

      # Handle a successful update.
    else
      render 'edit'
    end
end

def logged_in_artistt
      unless logged_in_artist?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_artist_url
      end
end

def correct_artist
      @artist = Artist.find(params[:id])
      redirect_to(root_url) unless current_artist?(@artist)
end

  private

    def artist_params
      params.require(:artist).permit(:name, :email, :password,
                                   :password_confirmation, :gravatar_url, :description, :skill, :experience, 
                                   :facebook_url, :twitter_url , :contact_no, :address, :country, :state, :city, 
                                   :availability, :youtube_url, :behance_url , :facebook_page, :blog_url, :website_url, :other_url , :motto_line)
    end


end
