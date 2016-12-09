// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require semantic-ui
//= require_tree .

$(document).ready(function() {
    $('#vyber-priklad').DataTable( {
        initComplete: function () {
            this.api().column(3).every( function () {
                var column = this;
                var select = $('<select id="vyber-priklad_kategoria" name="vyber-priklad_kategoria"><option value=""></option></select>')
                    .insertAfter( $('#vyber-priklad_filter')   )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );

                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
                select.wrap( "<div class='select-group'></div>" );
                var label = $('<label for="vyber-priklad_kategoria">Kategória:</label>')
                    .insertBefore($('#vyber-priklad_kategoria   '));
                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
            this.api().column(4).every( function () {
                var column = this;
                var select = $('<select id="vyber-priklad_stav" name="vyber-priklad_stav"><option value=""></option></select>')
                    .insertAfter( $('#vyber-priklad_filter')   )
                    .on( 'change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );

                        column
                            .search( val ? '^'+val+'$' : '', true, false )
                            .draw();
                    } );
                select.wrap( "<div class='select-group'></div>" );
                var label = $('<label class=""for="vyber-priklad_stav">Stav:</label>')
                    .insertBefore($('#vyber-priklad_stav'));

                column.data().unique().sort().each( function ( d, j ) {
                    select.append( '<option value="'+d+'">'+d+'</option>' )
                } );
            } );
        },
        language: {
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
    } );

    $('#organizator-form').submit( function(event) {
        var password = $("#password"), confirm_password = $("#password-confirm");
        console.log(password.val() != confirm_password.val());
        console.log(password.val());
        console.log(confirm_password.val());
        if(password.val() != confirm_password.val()) {
            event.preventDefault();
            var notice = '<div id="password-notice" class="ui red icon message"><span class="ui-icon ui-icon-notice"></span> <div class="content"> <div class="header">Heslá sa nezhodujú. </div> </div> </div>';
            $("#password-notice").remove();
            $("#fieldset-password").prepend(notice);
        } else{
            $("#password-notice").remove();
        }
    });



} );