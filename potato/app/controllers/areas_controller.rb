class AreasController < ApplicationController
protect_from_forgery with: :null_session
before_action :ensure_noedit

def show

end

def create
    @a = Area.new()
    @a.area_id = area_params[:area_id]
    @a.governor = area_params[:governor]
    @a.nrc = area_params[:fcb].split(",")[1]
    @a.nrf = area_params[:fcb].split(",")[0]
    @a.data_url = area_params[:data_url]
    @a.rule_contract = area_params[:rule_contract]
    @a.save!
    render json: true
end


def index

end


def ensure_noedit
    true
end

private

def area_params
    params.permit!
end

end