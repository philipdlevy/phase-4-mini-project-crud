class SpicesController < ApplicationController

    def index 
        spices = Spice.all 
        render json: spices
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        # spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            # render json: { error: "Plant not found" }, status: :not_found
            render_not_found_response
        end
    end

    def destroy
        spice = find_spice
        # spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            # render json: { error: "Plant not found" }, status: :not_found
            render_not_found_response
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def render_not_found_response
        render json: { error: "Plant not found" }, status: :not_found
    end


end
