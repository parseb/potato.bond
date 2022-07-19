require 'siwe'
require 'json'

class SessionsController < ApplicationController
  # include SessionsHelper
  protect_from_forgery with: :null_session

  def index
    @gid = GlobalState.last ? GlobalState.last.gid  : "0"
    render 'index'
  end

  def getgid
    @givenId = params[:gid].to_i
    lastId = GlobalState.last ? GlobalState.last.id : 0;
    if ( @givenId > lastId || @givenId == 0) 
      helpers.fetchAndUpdateAll(@givenId, lastId)
    end
    
  end

  def sign_in
    message = Siwe::Message.from_json_string session[:message]

    if message.validate(params.require(:signature))
      session[:message] = nil
      session[:ens] = params[:ens]
      session[:address] = message.address

      last_seen = DateTime.now
      User.upsert({ address: message.address, last_seen: last_seen })

      render json: { ens: session[:ens], address: session[:address], lastSeen: last_seen }
    else
      head :bad_request
    end
  end

  def profile
    if current_user
      current_user.seen
      current_user.save
      render json: { ens: session[:ens], address: session[:address], lastSeen: current_user.last_seen }
    else
      head :no_content
    end
  end

  def message
    nonce = Siwe::Util.generate_nonce
    message = Siwe::Message.new(
      request.host_with_port,
      params[:address],
      "#{request.protocol}#{request.host_with_port}",
      '1',
      {
        statement: 'potato.bond sign-in',
        nonce: nonce,
        chain_id: params[:chainId]
      }
    )

    session[:message] = message.to_json_string

    render plain: message.prepare_message
  end

  def sign_out
    if current_user
      current_user.seen
      current_user.save
      session[:ens] = nil
      session[:address] = nil
      head :no_content
    else
      head :unauthorized
    end
  end
end
