class AreasController < ApplicationController
protect_from_forgery with: :null_session
before_action :ensure_noedit

def show

end

def create
    binding.break
    @a = Area.new()
    given = params[:area]
    
end


def index

end


def ensure_noedit
    true
end

end