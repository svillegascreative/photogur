class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)                              # Make a new picture w/ args "picture_params"
    if @picture.save                                                    # If save successful,
      redirect_to pictures_url                                          # go to index/html.erb
    else                                                                # Otherwise,
      render :new                                                       # render view assoc'd w/ action :new (i.e. new.html.erb)
    end
  end

private
  def picture_params                                                    # method passed into create method above
    params.require(:picture).permit(:artist, :title, :url)              # specify args required and permitted
  end

end
