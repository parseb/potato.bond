module SessionsHelper
    # require 'eth'
    # require 'HTTP'
    
    def returns_contracts(_cid)

        rpcs = { 80001 => "MUMBAI" }
        client = Ethereum::HttpClient.new(ENV[rpcs[_cid.to_i]])
          
        areaMaddr = "0x164dc1865210e5cff1718c145d32d81765be0d51"
        farmerAt = "0xA80FE70C3C2B352ba181372DC6D72fD6234e6051"
        consumerAt = "0x5C2047F6BF4040b1bb4451777b470EFB44eEdC4A"
        basketAt = "0xd3AB598CA12D50B36a786286c04aEd4E49434E48"    
    
        abiA = File.read('./ABI/area')
        abiF = File.read('./ABI/farmer')
        abiB = File.read('./ABI/basket')
        abiC = File.read('./ABI/consumer')
    
        cA = Ethereum::Contract.create(client: client, name: "Area", address: areaMaddr, abi: abiA)
        cF = Ethereum::Contract.create(client: client, name: "Farmer", address: farmerAt, abi: abiF)
        cB = Ethereum::Contract.create(client: client, name: "Basket", address: basketAt, abi: abiB)
        cC = Ethereum::Contract.create(client: client, name: "Consumer", address: basketAt, abi: abiC)
    
        return cA,cF,cB,cC
      end
    
      def get_ids_A()
          x = HTTP.get("https://api.covalenthq.com/v1/80001/tokens/0x164dC1865210E5cff1718C145D32D81765Be0D51/nft_token_ids/?quote-currency=USD&format=JSON&key=ckey_dd30be32fd7244ebaf9cc39ae10")
          return x
      end


    def fetchAndUpdateAll(_start, _end, _chainId)
        puts("#{_start} ------ fech and update all #{_chainId} ------- #{_end}")
        returns_contracts(_chainId)
        ids = get_ids_A()
        return true
    end
        # do covalent fetch and push to db @todo
end
