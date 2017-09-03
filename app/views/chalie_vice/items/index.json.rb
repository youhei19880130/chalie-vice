@chalie_vice_items.map do |item|
  {
    id: item.id,
    name: item.name,
    price: item.price,
    image_url: item.item_images.first&.image&.url,
    url: chalie_vice_item_url(item, format: :json)
  }
end.to_json
