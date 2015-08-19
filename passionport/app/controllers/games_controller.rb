class GamesController < ApplicationController
  def show
     @games = current_user.games
     @owned_games = current_user.owned_games
     render 'show'
  end

  def create
    @games = Game.all
    unless current_user.games.find_by(title: params[:title])
      game = Game.find_by(title: params[:title])
      current_user.games << game if game
    end
    redirect_to 'show'
  end

  def delete
    OwnedGame.find(params[:owned_game_id]).delete
  end

end
