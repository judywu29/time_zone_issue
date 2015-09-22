class Team < ActiveRecord::Base
  has_many :playings, dependent: :destroy
  has_many :games, through: :playings
end
