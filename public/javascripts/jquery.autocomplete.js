
$(document).ready(function(){
  $('input[data-autocomplete]').live('focus', function(i){
    $(this).autocomplete({
      source: $(this).attr('data-autocomplete'),
      select: function(event, ui) {
        $(this).val(ui.item.value);
        if ($(this).attr('id_element')) {
          $($(this).attr('id_element')).val(ui.item.id);
        }
        return false;
      }
    });
  });
});