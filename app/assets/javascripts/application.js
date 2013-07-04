// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require autocomplete-rails
//= require lazybox
//= require jquery.remotipart
//= require_tree .


$(document).ready(function() {
  
  $('a#show_programacion_link').lazybox({closeImg: true});
  
  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.7, klass: 'lazybox', speed: 200});
  $.lazybox.settings = {cancelClass: "button green", submitClass: 'button red', closeImg: false, niceClose: false}
  $.rails.allowAction = $.lazybox.confirm;

  $('#municipio_center_nombre').bind('railsAutocomplete.select', function(event, data){
  $("#departamento_id").attr("value",data.item.id);
  });
 
  $('#nav > div').hover(
	function () {
        var $this = $(this);
        $this.find('img').stop().animate({
            'width'     :'199px',
            'height'    :'199px',
            'top'       :'-25px',
            'left'      :'-25px',
            'opacity'   :'1.0'
        },500,'easeOutBack',function(){
            $(this).parent().find('ul').fadeIn(700);
        });

        $this.find('a:first,h2').addClass('active');
    },
    function () {
        var $this = $(this);
        $this.find('ul').fadeOut(500);
        $this.find('img').stop().animate({
            'width'     :'52px',
            'height'    :'52px',
            'top'       :'0px',
            'left'      :'0px',
            'opacity'   :'0.1'
        },5000,'easeOutBack');

        $this.find('a:first,h2').removeClass('active');
    }
   );


});


