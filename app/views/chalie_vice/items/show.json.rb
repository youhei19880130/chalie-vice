{
  id: @chalie_vice_item.id,
  name: @chalie_vice_item.name,
  price: @chalie_vice_item.price,
  category_name: @chalie_vice_item.category_name,
  description: @chalie_vice_item.description,
  detail: @chalie_vice_item.detail,
  youtube_url: @chalie_vice_item.youtube_url,
  image_url: @chalie_vice_item.item_images.map { |image| image.image.url},
  url: chalie_vice_item_url(@chalie_vice_item, format: :json)
}.to_json
