class Team < ActiveRecord::Base
  has_and_belongs_to_many :games, joint_table: :teams_games
  
  validates :name, presence: true
  
end
