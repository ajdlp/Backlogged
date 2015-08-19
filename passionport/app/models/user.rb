class User < ActiveRecord::Base
  has_secure_password
  has_many :owned_games
  has_many :games, through: :owned_games
end
