class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: "Spice does not exist"
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: "Spice does not exist"
        end
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
