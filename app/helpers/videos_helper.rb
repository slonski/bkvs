module VideosHelper
  def in_stock(video_id)
    stock = ""
    inventories = Inventory.where("video_id = ?", video_id)
    inventories.each do |i|
     stock = stock + "#{i.location.name} (#{i.amount}) " if i.amount != 0
    end
    return "<span>Available at:</span> ".html_safe + stock unless stock == ""
    "<em>Currently out of stock</em>".html_safe
  end

  def video_list_image(video)
    image_tag "#{video.title.downcase.split.join('_')}.jpg", :onload=> "$(this).animate({opacity:0.8},1000)"
  end
end
