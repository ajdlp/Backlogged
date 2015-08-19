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
