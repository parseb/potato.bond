class BasketsController < ApplicationController
    
    
    
    
    def create
        @b = Basket.new()
        @b.area_id = basket_params[:area_id].to_s
        # @b.data_url = basket_params[:data_url] //separate call to 721A get url
        @b.farmer_address = basket_params[:farmer_address].to_s
        @b.consumer_address = basket_params[:consumer_address].to_s
        @b.nft_id = basket_params[:nft_id].to_s
        @b.erc_address = basket_params[:erc20].to_s
        @b.price = basket_params[:price].to_s
        @b.save
        render json: true
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
