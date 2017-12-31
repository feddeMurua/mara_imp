$(function () {

  var $sections = $('.form-section');
  var flag_r = 0 ;
  var flag_h = 0 ;

  function navigateTo(index) {
    // Mark the current section with the class 'current'
    $sections
      .removeClass('current')
      .eq(index)
        .addClass('current');
    // Show only the navigation buttons that make sense for the current section:
    $('.form-navigation .previous').toggle(index > 0);
    var atTheEnd = index >= $sections.length - 1;
    $('.form-navigation .next').toggle(!atTheEnd);
    $('.form-navigation [type=submit]').toggle(atTheEnd);

    //Indice del residuo generador
    if ((curIndex() == 5) && (flag_r == 0))  {
      $('#fieldset_residuo').formset({
          prefix: 'fs2',
          addText: 'Agregar otro residuo',
          deleteText: 'Eliminar'
      });
      flag_r =1;
      //Indice del horario
    } else if ((curIndex() == 7) && (flag_h == 0)) {
      $('#fieldset_horario').formset({
          prefix: 'fs1',
          addText: 'Agregar otro horario',
          deleteText: 'Eliminar'
      });
      flag_h =1;
    }

  }

  function curIndex() {
    // Return the current index by looking at which section has the class 'current'
    return $sections.index($sections.filter('.current'));
  }

  // Previous button is easy, just go back
  $('.form-navigation .previous').click(function() {
    navigateTo(curIndex() - 1);
  });

  // Next button goes forward iff current block validates
  $('.form-navigation .next').click(function() {
    $('.form-wizard').parsley().whenValidate({
      group: 'block-' + curIndex()
    }).done(function() {
      navigateTo(curIndex() + 1);
    });
  });

  // Prepare sections by setting the `data-parsley-group` attribute to 'block-0', 'block-1', etc.
  $sections.each(function(index, section) {
    $(section).find(':input').attr('data-parsley-group', 'block-' + index);
  });
  navigateTo(0); // Start at the beginning


});
