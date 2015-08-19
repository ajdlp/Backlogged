class GamesController < ApplicationController

  def index
    @games = current_user.games
    @backlogged_games = current_user.backlogged_games
    render 'index'
  end

  def show
  end

  def create
    # @backlogged_games = current_user.backlogged_games
    # unless current_user.games.find_by(title: params[:title])
    game = Game.find_by(title: params[:game][:title])
    current_user.games << game if game
    # end
    redirect_to user_games_path
  end

  def delete
    BackloggedGame.find(params[:owned_game_id]).delete
  end

end
