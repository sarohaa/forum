class ChatRoomsController < ApplicationController
	def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end
   def show
   	 @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
     @message = Message.new
   end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end
  def destroy
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.destroy
    respond_to do |format|
      flash[:success] = 'ChatRoom was successfully deleted.'
      format.html { redirect_to chat_rooms_url }
      format.json { head :no_content }
    end
  end


  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
