# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.ui.dropdown')
  .dropdown()

  $('.datatable').DataTable(
    "language": {
      "lengthMenu": "Zobraz _MENU_ záznamov na stránku",
      "zeroRecords": "Neexistuje žiaden záznam.",
      "info": "Stránka _PAGE_ z _PAGES_",
      "infoEmpty": "Prázdna",
      "infoFiltered": "(filtrované z _MAX_ záznamov)",
      "paginate": {
        "first":      "First",
        "last":       "Last",
        "next":       "Nasledujúca",
        "previous":   "Predchádzajúca"
      },

    }
  );

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

  $('#add-clanok').on "click", ->
    pocet = parseInt($('#pocet-clankov').html()) + 1
    $('#pocet-clankov').html(pocet)
    $('#clanok_cnt').attr('value', pocet)

  $('#remove-clanok').on "click", ->
    pocet = parseInt($('#pocet-clankov').html()) - 1
    if pocet >= 0
      $('#pocet-clankov').html(pocet)
      $('#clanok_cnt').attr('value', pocet)
