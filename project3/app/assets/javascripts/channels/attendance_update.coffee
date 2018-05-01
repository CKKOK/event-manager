App.attendance_update = App.cable.subscriptions.create "AttendanceUpdateChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    queryString = '#' + data.update.id + ' > .attended_checkbox'
    checkbox = document.querySelector(queryString)
    if !checkbox.checked
      checkbox.checked = data.update.attended
      checkbox.value = data.update.attended
      UI.attendanceCurrent.update(1)

