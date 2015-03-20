class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  


  respond_to :html

  def index
  @games = Game.where(availability: true)
  respond_with(@games)
  end

  def show
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
    authorize! :manage, @game
  end

  def create
    @game = current_user.games.new(game_params)
    @game.save
    respond_with(@game)
  end

  def update
    authorize! :manage, @game
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    authorize! :manage, @game
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :platform, :description, :price, :availability, :image, :resource)
    end
end
