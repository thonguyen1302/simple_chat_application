App.conversation = App.cable.subscriptions.create("ConversationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    $("#card_" + data['sender_id']).addClass('bg-info');
    var conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
 
    if (data['window'] !== undefined) {
      var conversation_visible = conversation.is(':visible');
 
      if (conversation_visible) {
        var messages_visible = (conversation).find('.panel-body').is(':visible');
 
        if (!messages_visible) {
          conversation.removeClass('panel-default').addClass('panel-success');
        }
        conversation.find('.messages-list').find('ul').append(data['message']);
      }
      else {
        $('#conversations-list').append(data['window']);
        conversation = $('#conversations-list').find("[data-conversation-id='" + data['conversation_id'] + "']");
        conversation.find('.panel-body').toggle();
      }
    }
    else {
      conversation.find('ul').append(data['message']);
    }
  },
  speak: function(message) {
    return this.perform('speak', {
      message: message
    });
  }
});

$(document).on('submit', '.new_message', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.conversation.speak(values);
  $(this).trigger('reset');
});
