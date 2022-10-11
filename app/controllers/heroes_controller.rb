class HeroesController < ApplicationController
    def index
        heroes = Hero.all
        render json: heroes, status: :ok
    end

    def show
        hero = Hero.find_by(id: params[:id])
        if hero
            render json: hero, include: :powers, status: :ok
        else
            render json: { error: "Superhero not found" }, status: :not_found
        end
    end
end