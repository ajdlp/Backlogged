// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
// = require turbolinks
// = require_tree .

$(document).ready(function() {
 deleteGame();
 $('.platform').hover(function(){
  $(this).effect('pulsate', {times:1}, 700);
})
 $('#gametable').resizable();
 $('table tbody').sortable({
  helper: rowHelper
}).disableSelection();
});


var deleteGame = function(){
  $('#gametable').on('click', ".delete", function(){
    var id = $(this).attr("id")
    $.ajax({
      url: '/delete/game',
      method: "delete",
      data: {owned_game_id: id}
    }).done(function(response){
      $("tr."+ id).remove();
    })
  })
}

function rowHelper(e, ui) {
  ui.children().each(function() {
    $(this).width($(this).width());
  });
  return ui;
}
