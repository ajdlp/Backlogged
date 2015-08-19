class User < ActiveRecord::Base
  has_secure_password
  has_many :backlogged_games
  has_many :games, through: :backlogged_games
end
