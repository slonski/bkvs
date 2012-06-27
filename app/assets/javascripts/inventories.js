$(function(){
   $('.check-stock').click(function(){
     var location_id = $('.location-select').val();
     var video_id = $('.video-select').val();
     $.ajax({
       url: 'select_inventory?location_id=' + location_id + '&video_id=' + video_id,
       success: function(data) {
         $('.result span').html(data);
       }
     });
   });
});