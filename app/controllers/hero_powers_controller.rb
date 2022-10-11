class HeroPowersController < ApplicationController
    def index
        hero_powers = HeroPower.all
        render json: hero_powers
    end

    def show
        hero_power = HeroPower.find_by(id: params[:id])
        render json: hero_power
    end

    def create
        hero_power = HeroPower.create!(hero_power_params)
        if hero_power.valid?
            render json: Hero.find_by(id: hero_power_params[:hero_id]),status: :created, include: :powers
        else
            render json:{ error: hero_power.errors.full_messages}
        end
    end

    private

    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end
end
