class RoomsController < ApplicationController
  before_action :find_room, only: [:update, :show, :destroy]

  def index
  end

  def new
    @building = Building.find(params[:building_id])
    @room = Room.new(building_id: params[:building_id] )    
  end

  def create
    @building = Building.find(params[:building_id])    
    @room = Room.new(room_params)  
    @room.user_id = current_user.id
    @room.chatroom = Chatroom.new
    if @room.save 
      @purchase = Purchase.creating(@room, Price.free, current_user, true)
      @building.room_items(@purchase)
      flash[:notice] = "Your Room was saved"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the Room was not saved"
      render "new"
    end     
  end

  def edit
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
  end

  def update
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to buildings_path, notice: 'Room was successfully updated.' }
        format.json { render buildings_path, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end  

  def show
    @price = Price.new
    @room = Room.find(params[:id])
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    @purchase = Purchase.new(room_id: @room.id)
    @purchase.items << @items
    @items_number = @items.group(:product_id).count    
    @chatroom = @room.chatroom
  	@message = Message.new
    @purchases = Purchase.where(sale_id: nil, room_id: @room.id)
    #users_count = @purchases.group(:user).count.to_a
    #users_count.each do |user_count|
      #user = user_count[0]
      #count = user_count[1]
    #end
  end

  def delete
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice] = "The Room was destroyed"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the room was not saved"
      render "delete"
    end    
  end

  private
  def room_params
    params.require(:room).permit(:title, :description, :building_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
