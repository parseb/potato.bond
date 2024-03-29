class ConsumersController < ApplicationController

    def create
        @c = Consumer.new
        @c.area_id = consumer_params[:area_id]
        @c.address = consumer_params[:address]
        @c.nft_id = consumer_params[:nft_id]
        @c.save
        render json: true
    end


    def new
        @consumer = Consumer.new
    end


    def index 
        @consumers = Consumer.all
        render json: @consumers
    end


    def show
        @consumer = Consumer.find_by(nft_id: farmer_params[:nft_id])
        render json: @consumer
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

    def consumer_params
        params.permit!
    end

end
