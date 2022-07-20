require 'siwe'
require 'json'
require 'eth'
require 'forwardable'
require "http"


class SessionsController < ApplicationController
  # include SessionsHelper
  protect_from_forgery with: :null_session

  def index
    @gid = GlobalState.last ? GlobalState.last.gid  : "0"
    render 'index'
  end

  def returns_contracts(_cid)

    rpcs = { 80001 => "MUMBAI" }
    client = Eth::Client.create ENV[rpcs[_cid.to_i]]
      
  

    abiA = File.read('app/helpers/ABI/area')
    abiF = File.read('app/helpers/ABI/farmer')
    abiB = File.read('app/helpers/ABI/basket')
    abiC = File.read('app/helpers/ABI/consumer')
    binding.break

    cA = Eth::Contract.from_abi( abi: abiA, address: areaMaddr, name: "Area")
    cF = Eth::Contract.create(client: client, name: "Farmer", address: farmerAt, abi: abiF)
    cB = Eth::Contract.create(client: client, name: "Basket", address: basketAt, abi: abiB)
    cC = Eth::Contract.create(client: client, name: "Consumer", address: basketAt, abi: abiC)
    #binding.break
    return cA,cF,cB,cC
  end

  # def get_ids_A(_chainId)
  #     x = HTTP.get("https://api.covalenthq.com/v1/80001/tokens/0x164dC1865210E5cff1718C145D32D81765Be0D51/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
  # end

  def get_ids_B(_chainId, baskerAddr)
    bbb = HTTP.get("https://api.covalenthq.com/v1/#{_chainId}/tokens/#{baskerAddr}/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
  end
  
  def get_ids_C(_chainId, consumerAddr)
    ccc = HTTP.get("https://api.covalenthq.com/v1/#{_chainId}/tokens/#{consumerAddr}/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
  end

  def get_ids_F(_chainId, farmerAddr)
    fff = HTTP.get("https://api.covalenthq.com/v1/#{_chainId}/tokens/#{farmerAddr}/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
  end



def fetchAndUpdateAll(_start, _end, _chainId)
    areaMaddr = "0x5e2c0bc8705addbd360c7ee749ff8d7dc5f13269"
    farmerAt = "0x2C6AFA0111C4646cae3E5FC21226D1a816C37B82"
    consumerAt = "0x50F62f9b4930571D973a646AECC59933Bd5E4648"
    basketAt = "0x620B5892c71773A9A6e92da827610e43c8618518"  

    
    puts("#{_start} ------ fech and update all #{_chainId} ------- #{_end}")
    # returns_contracts(_chainId)
    basket_ids = get_ids_B(_chainId, basketAt).to_s
    consumer_ids = get_ids_B(_chainId,consumerAt).to_s
    farmer_ids = get_ids_F(_chainId,farmerAt).to_s
    binding.break
    return true
end

  def getgid
    @givenId = params[:gid].to_i
    lastId = GlobalState.last ? GlobalState.last.id : 0;
    if ( @givenId > lastId || @givenId == 0) 
      fetchAndUpdateAll(@givenId, lastId, 80001 )
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
