json.extract! @word, :id, :text

json.places @word.places do |json, place|
  json.extract! place, :id, :position
  json.source_places place.source_places do |json, source_place|
    json.extract! source_place, :id
  end
end