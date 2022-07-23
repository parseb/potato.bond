class FarmersController < ApplicationController
    def create
        @f = Farmer.new
        @f.area_id = farmer_params[:area_id]
        @f.address = farmer_params[:farmerAddress]
        @f.data_url = farmer_params[:ipfs]
        @f.amount_issued = farmer_params[:issued]
        @f.amount_fulfilled = farmer_params[:fulfilled]
        @f.gps = farmer_params[:gps]
        @f.nft_id = farmer_params[:nft_id]
        @f.save 

        render json: @f.data_url
    end

    def new
        @farmer = Farmer.new
    end


    def index 
        @farmers = Farmer.all
        render json: @farmers
    end


    def show
        @farmer = Farmer.find_by(nft_id: farmer_params[:nft_id])
        render json: @farmer
    end
    

    private

    def farmer_params
        params.permit!
    end

end
