class VideosController < ApplicationController

  def index
    @videos = Video.all
    @locations = Location.all


  end

  def show
    @video = Video.find(params[:id])

  end

  def new
    @video = Video.new

  end


  def edit
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(params[:video])

    respond_to do |format|
      if @video.save
        locations = Location.all
        locations.each do |location|
          inventory = Inventory.new({:video_id => @video.id, :location_id => location.id, :amount => 0})
          inventory.save
        end


        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end
