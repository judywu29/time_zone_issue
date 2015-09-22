json.array!(@games) do |game|
  json.extract! game, :id, :name, :start_time, :end_time, :result
  json.url game_url(game, format: :json)
end
