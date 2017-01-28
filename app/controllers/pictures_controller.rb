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

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

private
  def picture_params                                                    # method passed into create method above
    params.require(:picture).permit(:artist, :title, :url)              # specify args required and permitted
  end

end
