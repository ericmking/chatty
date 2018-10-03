class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    body = data['message']
    chat_room_id = data['chat_room_id']

    Message.create_message_with_reminders(body, chat_room_id, current_user.id)
  end
end