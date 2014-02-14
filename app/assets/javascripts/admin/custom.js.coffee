jQuery ($) ->
#  $.ajax(url: "/admin/categories/new").done(html) ->
#    console.log(html)

#  $.get '/admin/categories/new', (data) ->
#    $('.from_new').html data
  $('#jstree_div').jstree({
    "checkbox" : {"keep_selected_style" : false},
    "plugins" : [ "wholerow" ]
  })
  $('#jstree_div').on "changed.jstree", (e, data) ->
    console.log(data.selected)
    console.log(e)

  $('form').on 'click', '.remove_image', (event) ->
    event.preventDefault()
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.picture_block').hide()

  $('form').on 'click', '.lot_activate_link', (event) ->
    event.preventDefault()
    $('#lot_status').val('started')
    $(this).hide()
    console.log(event)

  $('form').on 'click', '.lot_reset_link', (event) ->
    event.preventDefault()
    $('#lot_status').val('not_started')
    $(this).hide()
    console.log(event)

