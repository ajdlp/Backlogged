class GamesController < ApplicationController
  def show
     @games = current_user.games
     @backlogged_games = current_user.backlogged_games
  end

  def create
    @games = Game.all
    unless current_user.games.find_by(title: params[:title])
      game = Game.find_by(title: params[:title])
      current_user.games << game if game #associate game with user if game entered in search bar exists
    end
  end

  def delete
    BackloggedGame.find(params[:backlogged_game_id]).delete
  end

end
