class FarmersController < ApplicationController
    def create
        @f = Farmer.new
        @f.area_id = farmer_params[:area_id]
        @f.address = farmer_params[:farmer_address]
        @f.data_url = farmer_params[:ipfs]
        @f.amount_issued = farmer_params[:issued]
        @f.fulfilled = farmer_params[:fulfilled]
        @f.nft_id = farmer_params[:nft_id]

        @f.save
        render json: true
#this does not save as expected
    end


    # id: nil,                                                            
    # address: nil,                                                       
    # name: nil,                                                          
    # email: nil,                                                         
    # pending: nil,                                                       
    # claimed: nil,                                                       
    # data_url: nil,                                                      
    # area_address: nil,                                                  
    # nft_id: nil,                                                        
    # area_id: nil,                                                       
    # created_at: nil,                                                    
    # updated_at: nil>       

    private

    def farmer_params
        params.permit!
    end

end
