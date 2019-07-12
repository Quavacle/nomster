class PlacesController < ApplicationController
    

    def index
        @places = Place.all.page(params[:page])
    end
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def new
        @place = Place.new
    end  

    def create
        @place = current_user.places.create(place_params)
        if @place.valid?
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    def update
        @place = Place.find(params[:id])
        if @place.user != current_user
            return render plain: 'Not allowed', status: :forbidden
        end
        @place.update_attributes(place_params)
        if @place.valid?     
            flash[:alert] = 'Update successful'
        else
            render :edit, status: :unprocessable_entity
        end
        
    end
    def show
        @place = Place.find(params[:id])
        @comment = Comment.new
    end

    def edit
        @place = Place.find(params[:id])

        if @place.user != current_user
            return render plain: 'Not allowed', status: :forbidden
        end
    end     
    def destroy
        @place = Place.find(params[:id])
        if @place.user != current_user
            return render plain: 'Not allowed', status: :forbidden
        end
        @place.destroy
        redirect_to root_path
    end
    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end
end
