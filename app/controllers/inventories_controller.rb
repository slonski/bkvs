class InventoriesController < ApplicationController
  # GET /inventories
  # GET /inventories.json
  def index
    @locations = Location.all
    @videos = Video.all
    @inventories = Inventory.order(:location_id)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/new
  # GET /inventories/new.json
  def new
    @inventory = Inventory.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/1/edit
  def edit
    @inventory = Inventory.find(params[:id])
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(params[:inventory])

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render json: @inventory, status: :created, location: @inventory }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventories/1
  # PUT /inventories/1.json
  def update
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      if @inventory.update_attributes(params[:inventory])
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url }
      format.json { head :no_content }
    end
  end

  def select_inventory
   @inventory = Inventory.where('location_id = ?',params[:location_id]).where('video_id = ?', params[:video_id])
   render :partial => "selected", :locals => {:amount => @inventory.first.amount, :edit_url => "/inventories/#{@inventory.first.id}/edit"}
  end

end
