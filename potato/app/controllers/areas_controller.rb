class AreasController < ApplicationController
protect_from_forgery with: :null_session
before_action :ensure_noedit

def show

end

def create
    @a = Area.new
    @a.area_id = area_params[:area_id] || (GlobalState.last.gid.to_i + 1).to_s
    @a.governor = area_params[:governor]
    if area_params[:fcb]
        @a.nrc = area_params[:fcb].split(",")[1] || 0
        @a.nrf = area_params[:fcb].split(",")[0] || 0
    end
    # @a.data_url = area_params[:data_url] -after save
    @a.rule_contract = area_params[:rule_contract] || "0x0000000000000000000000000000000000000000"
    @a.save!
    render json: @a.data_url
end



def new
    @area = Area.new
end


def index 
    @areas = Area.all
    render json: @areas
end


def show
    @area = Area.find(area_params[:id])
    render json: @area
end

def ensure_noedit
    true
end

private

def area_params
    params.permit!
end

end