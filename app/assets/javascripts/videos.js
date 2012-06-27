$(document).ready(function(){
  $(".inline").fancybox();
  $('a img').hover(function(){
    $(this).stop().animate({opacity:1,top:5},200);
  }, function(){
    $(this).stop().animate({opacity:0.8,top:0},200);
  });
});