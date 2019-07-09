class PlacesController < ApplicationController
    

    def index
        @places = Place.all.page(params[:page])
    end
    before_action :authenticate_user!, only: [:new, :create]
    def new
        @place = Place.new
    end  

    def create
        @place = current_user.places.create(place_params)
        if @place.invalid?
        flash[:error] = 'Something went wrong!'
        end
        redirect_to root_path
    end
    def update
        @place = Place.find(params[:id])
        @place.update_attributes(place_params)
        if @place.valid?
            flash[:alert] = 'Update successful'
        end
        redirect_to root_path
    end
    def show
        @place = Place.find(params[:id])
    end

    def edit
        @place = Place.find(params[:id])
    end     
    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end
