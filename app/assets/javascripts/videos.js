$(document).ready(function(){
  $("a#trailer").fancybox();
  $('a img').hover(function(){
    $(this).stop().animate({opacity:1,top:5},200);
  }, function(){
    $(this).stop().animate({opacity:0.8,top:0},200);
  });
});




$(".fancyYoutube").fancybox({
'transitionIn' : 'elastic',
'padding' : 0,
'autoScale' : false,
'transitionOut' : 'fade',
'width' : 680,
'height' : 495,
'type' : 'swf'
});