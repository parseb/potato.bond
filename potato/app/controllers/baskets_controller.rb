class BasketsController < ApplicationController
    
    
    
    
    def create
        @b = Basket.new
        @b.area_id = basket_params[:area_id].to_s
        # @b.data_url = basket_params[:data_url] //separate call to 721A get url
        @b.farmer_address = basket_params[:farmer_address] || current_user.address 
        @b.consumer_address = basket_params[:consumer_address] || "0x0000000000000000000000000000000000000000"
        @b.nft_id = basket_params[:nft_id].to_s || (Basket.last.nft_id + 1).to_s ## @todo maybe check/update data script or call back after 
        @b.erc_address = basket_params[:erc20].to_s || basket_params[:erc_address] ## @todo harmoize thr passing of parameters on all operations as to reflect localdb state
        @b.price = basket_params[:price].to_s

        @b.save
        ## @todo add from-to range to db... ux
        render json: @b.data_url
    end


    def new
        @basket = Basket.new
    end


    def index 
        @baskets = Basket.all
        render json: @baskets
    end


    def show 
        @basket = Basket.find_by(nft_id: basket_params[:nft_id])
        render json: @basket
    end
    # id: nil,                                                     
    # data_url: nil,                                               
    # farmer_address: nil,                                         
    # consumer_address: nil,                                       
    # state: nil,                                                  
    # nft_id: nil,                                                 
    # area_id: nil,                                                
    # price: nil,                                                  
    # erc_address: nil,                                            
    # created_at: nil,                                             
    # updated_at: nil>      

    private

    def basket_params
        params.permit!
    end
end
