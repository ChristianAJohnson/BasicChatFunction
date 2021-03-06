class RoomChannel < ApplicationCable::Channel
  def subscribed
   stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	# ActionCable.server.broadcast "room_channel", data["message"] #this was used to broadcast the message on to the screen
  	Message.create content: data["message"], user: current_user
  end
end
