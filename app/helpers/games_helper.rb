module GamesHelper
  def cache_key_for_games
    count = Game.count
    max_updated_at = Game.maximum(:updated_at).try(:to_s, :number)
    "games/all-#{count}-#{max_updated_at}"
  end
end
