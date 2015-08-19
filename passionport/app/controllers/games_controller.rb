class GamesController < ApplicationController
  def show
     @games = current_user.games
     @owned_games = current_user.owned_games
     render 'show'
  end

  def new

  end

end
