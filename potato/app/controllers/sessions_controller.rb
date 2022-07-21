require 'siwe'
require 'json'
require 'eth'
require 'forwardable'
require "httparty"



class SessionsController < ApplicationController
  # include SessionsHelper
  protect_from_forgery with: :null_session
  before_action :set_addresses

  def index
    @gid = GlobalState.last ? GlobalState.last.gid  : "0"
    render 'index'
  end

  def set_addresses
    @areaMaddr = "0x5e2c0bc8705addbd360c7ee749ff8d7dc5f13269"
    @farmerAt = "0x2C6AFA0111C4646cae3E5FC21226D1a816C37B82"
    @consumerAt = "0x50F62f9b4930571D973a646AECC59933Bd5E4648"
    @basketAt = "0x620B5892c71773A9A6e92da827610e43c8618518"  

    return @areaMaddr, @farmerAt, @consumerAt, @basketAt
  end

  def returns_contracts(_cid)

    #rpcs = { 80001 => "MUMBAI" }
    #client = Eth::Client.create ENV[rpcs[_cid.to_i]]
    #      # https://polygon-mumbai.infura.io/v3/

    # @web3 = Web3::Eth::Rpc.new host: 'polygon-mumbai.infura.io',
    #                       connect_options: {
    #                         open_timeout: 20,
    #                         read_timeout: 140,
    #                         use_ssl: true,
    #                         rpc_path: "/v3/{KEEEEYEYYYY}"
    #                       }

    #abiA = File.read('app/assets/ABI/area')

    abi721 = File.read('app/assets/ABI/721')
    areaI = File.read('app/assets/ABI/areaI')

    #abiF = File.read('app/assets/ABI/farmer')
    #abiB = File.read('app/assets/ABI/basket')
    #abiC = File.read('app/assets/ABI/consumer')

    #aa = web3.eth.contract(abiA);
    #ff = web3.eth.contract(abiF);
    #bb = web3.eth.contract(abiB);
    #cc = web3.eth.contract(abiC);

    ierc721 = @web3.eth.contract(abi721)
    areaI = @web3.eth.contract(areaI)

    # @cA = aa.at(@areaMaddr)
    # @cF = ff.at(@farmerAt)
    # @cB = bb.at(@basketAt)
    # @cC = cc.at(@consumerAt)
    
    @cA = areaI.at(@areaMaddr)
    @cF = ierc721.at(@farmerAt)
    @cB = ierc721.at(@basketAt)
    @cC = ierc721.at(@consumerAt)

    #binding.break
    return @cA, @cF,@cB,@cC,@web3
  end

  # def get_ids_A(_chainId)
  #     x = HTTP.get("https://api.covalenthq.com/v1/80001/tokens/0x164dC1865210E5cff1718C145D32D81765Be0D51/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
  # end



  def get_ids_covalent(_chainId, baskerAddr)
    #bbb =[]
    url = "https://api.covalenthq.com/v1/#{_chainId}/tokens/#{baskerAddr}/nft_token_ids/?quote-currency=USD&format=JSON&page-size=100000&key=ckey_dd30be32fd7244ebaf9cc39ae10"
    response = HTTParty.get(url)
    return response["data"]["items"].map { |r| r["token_id"] }
  end

  def fetchAndUpdateAll(_start, _end, _chainId)
      
      puts("#{_start} ------ fech and update all #{_chainId} ------- #{_end}")
      # refactor this to exclude any existing gId & skip classes
      # or just call Area.getALL where id> current, filter after type and save in db
      b_last = Basket.any? ? Basket.last.nft_id.to_i : 0
      c_last = Consumer.any? ? Consumer.last.nft_id.to_i : 0
      f_last = Farmer.any? ? Farmer.last.nft_id.to_i : 0
      basket_ids = get_ids_covalent(_chainId, @basketAt).map{|i| i.to_i if i.to_i > b_last}
      consumer_ids = get_ids_covalent(_chainId,@consumerAt).map{|i| i.to_i if i.to_i > c_last}
      farmer_ids = get_ids_covalent(_chainId,@farmerAt).map{|i| i.to_i if i.to_i > f_last}
      area_ids = []
      all = farmer_ids + basket_ids + consumer_ids
      z=all.max
      z.times do |z| ! all.include?(z) ? area_ids << z : 0 end
      
      # fetchables  = GlobalState.last.fetchables.to_json
      # basket_ids = basket_ids - fechables['baskets']
      # consumer_ids = consumer_ids - fechables['consumers']
      # farmer_ids = farmer_ids - fetchables['farmers']




      # returns_contracts(80001)
      # binding.break
      #no working ruby web3 library found. revert to javascript

      return  ['areas': area_ids, 'farmers': farmer_ids, 'consumers': consumer_ids, 'baskets': basket_ids]
  end

  def getgid
    @givenId = params[:gid].tr('^0-9', '').to_i
    lastId = GlobalState.last ? GlobalState.last.gid.to_i : 0 
    if (  @givenId > lastId ) 
      g = GlobalState.last ? GlobalState.last : GlobalState.new
      # g.gid = @givenId
      newIds = fetchAndUpdateAll(lastId, @givenId, 80001)
      g.fetchables = newIds
      g.save
      render json: newIds
    else
      render json: true
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
