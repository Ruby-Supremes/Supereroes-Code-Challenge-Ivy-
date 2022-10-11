class PowersController < ApplicationController
    def index
        powers=Power.all
        render json: powers, status: :ok
    end
 
    def show
        power=Power.find_by(id: params[:id])
        if power
            render json: power, status: :found
        else
          render json: {error: "Power not found"}, status: :not_found  
        end
    end 

    def update
        power=Power.find_by(id: params[:id])
        if power
            if power.update(power_params)
                render json: power, status: :accepted
            else
                render json:{ error: power.errors.full_messages}
            end
        else
            render json: {error: "Power not found" }, status: :not_found
        end
    end

    private

    def power_params
        params.permit(:name,:description)
    end

end
