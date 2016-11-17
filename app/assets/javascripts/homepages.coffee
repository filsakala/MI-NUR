# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.ui.dropdown')
  .dropdown()

  $('.datatable').DataTable();

  $('.move_up').on "click", ->
    id = parseInt($(this).attr('id').split("up")[1], 10)
    act_tdN = $('#prikladN' + id).html()
    act_tdA = $('#prikladA' + id).html()
    prev_tdN = $('#prikladN' + (id - 1)).html()
    prev_tdA = $('#prikladA' + (id - 1)).html()

    $('#prikladN' + id).html(
      prev_tdN
    )
    $('#prikladA' + id).html(
      prev_tdA
    )
    $('#prikladN' + (id - 1)).html(
      act_tdN
    )
    $('#prikladA' + (id - 1)).html(
      act_tdA
    )

  $('.move_down').on "click", ->
    id = parseInt($(this).attr('id').split("down")[1], 10)
    act_tdN = $('#prikladN' + id).html()
    act_tdA = $('#prikladA' + id).html()
    prev_tdN = $('#prikladN' + (id + 1)).html()
    prev_tdA = $('#prikladA' + (id + 1)).html()

    $('#prikladN' + id).html(
      prev_tdN
    )
    $('#prikladA' + id).html(
      prev_tdA
    )
    $('#prikladN' + (id + 1)).html(
      act_tdN
    )
    $('#prikladA' + (id + 1)).html(
      act_tdA
    )

  $('.refresh').on "click", ->
    path = $('#refreshed').children('embed').attr('src')
    $('#refreshed').html(
      "<embed src=\"" + path + "\" />"
    )