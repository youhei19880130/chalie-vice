@chalie_vice_letters.map do |letter|
  {
    id: letter.id,
    category_name: letter.category_name,
    name: letter.name,
    image_url: letter.thumb_image.url,
    url: chalie_vice_letter_url(letter, format: :json)
  }
end.to_json
