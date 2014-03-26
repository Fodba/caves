jQuery('html').addClass('hasJavascript');

jQuery(function () {
  initCarousel();
  $('.dropdown-toggle').dropdown();
});

jQuery(window).load(function(){
  //levelOutLayoutCols();
});

/****************************************************
   - LEVEL OUT COLUMNS
****************************************************/
function levelOutLayoutCols(){
  var cols = jQuery('#left, #main, #right');
  if(cols[0]){
    var height = 0;
    cols.each(function(){
      var tmpHeight = jQuery(this).height();
      if(tmpHeight > height){
        height = tmpHeight;
      }
    });
    
    cols.height(height);
  }
}

/****************************************************
   - CAROUSEL
****************************************************/
function initCarousel(){
  var carousel = $('.carousel');
  if(carousel[0]){
    carousel.find('.item:first').addClass('active');
    carousel.carousel({
      interval: 4000
    });
  }
}