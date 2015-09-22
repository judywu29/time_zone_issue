class Game < ActiveRecord::Base
  has_many :playings, dependent: :destroy
  has_many :teams, through: :playings
  
    
  scope :playing_currently, ->(time){where("end_time >= ? and start_time <= ?", time, time)}
  scope :playing_before, ->(time) {where("end_time < ?", time)}
  scope :playing_after, ->(time) {where("start_time > ?", time)}
  
  
  #define 3 macro class methods: games played currently, before and in the future
  def self.current_games
    playing_currently(Time.zone.now)
  end
  
  def self.history_games
    playing_before(Time.zone.now)
  end
  
  def self.future_games
    playing_after(Time.zone.now)
  end
end
