class PlacesController < ApplicationController
    def index
        @places = Place.all.page(params[:page])
    end

    def new
        @place = Place.new
    end  

    def create
        @place = Place.create(place_params)
        if @place.invalid?
        flash[:error] = 'Something went wrong!'
        end
        redirect_to root_path
    end

    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end
