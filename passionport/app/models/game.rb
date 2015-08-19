class Game < ActiveRecord::Base
has_many :backlogged_games
has_many :users, through: :backlogged_games
end
