# app/assets/javascripts/cable/subscriptions/chat.coffee
# Assumes you've already requested the right to send web notifications
App.cable.subscriptions.create { channel: "MessagesChannel" },
  received: (data) ->
    messages = $('#chatroom_id')
    chat_room_id = messages.data('chat-room-id')
    if data.chatroom_id == chat_room_id
      $("#messages").removeClass('hidden')
      $('#messages').append(@renderMessage(data))
      @scrollDownChat()
  scrollDownChat: ->
    height = $('.scroll-bar')[0].scrollHeight
    $('.scroll-bar').scrollTop(height)
  renderMessage: (data) ->
    """
    <p class="message #{data.alignment}">#{data.user}: #{data.message}</p>
    """