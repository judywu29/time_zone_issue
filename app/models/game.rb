class Game < ActiveRecord::Base

  has_and_belongs_to_many :teams, joint_table: :teams_games
  
  validates :name, :start_time, presence: true
  
  Now = Time.now

  scope :history_current_games, -> { where("start_time <= ?", Now).order(start_time: :desc) }
  scope :future_games, -> { where("start_time > ?", Now) }
  
  def self.current_games
    history_current_games.where(result: "")
  end
  
  def self.history_games
    history_current_games.where("end_time <= ?", Now)
  end
end
