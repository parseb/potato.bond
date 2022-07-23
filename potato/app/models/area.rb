class Area < ApplicationRecord

    before_create :uploadToIpfs

    # has_many :consumers, primary_key: "area_id", foreign_key: "area_id"
    # has_many :farmers, primary_key: "area_id", foreign_key: "area_id"
    # has_many :baskets, primary_key: "area_id", foreign_key: "area_id"



    private

    def uploadToIpfs()
        require 'nft_storage'
        type_z = self.class.name
        p "uploading to ipfs: #{type_z} : #{self.area_id}"

        body = {
            "name": "potato.bond",
            "description": "This is a potato.bond #{type_z}.",
            "image": "https://images.pexels.com/photos/144248/potatoes-vegetables-erdfrucht-bio-144248.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            "details": {
              "type": "string",
              "description": "#{self.description.to_s}"
          },
            "properties": {
              "type": "string",
              "origin": "https://potato.bond/#{type_z.pluralize}/#{self.area_id}",
              "area": "#{self.area_id}",
            },
            "data":"#{self.to_json}"
          }

        NFTStorage.configure do |config|
            # Configure Bearer authorization (JWT): bearerAuth
            config.access_token = ENV['NFTS_TOKEN']
            config.client_side_validation = false
          end
          
          api_instance = NFTStorage::NFTStorageAPI.new
          body = body
          begin
            # Store a file
            result = api_instance.store(body)
            #data, status_code, headers = api_instance.store_with_http_info(body)
            p result.value
            self.data_url = result.value.cid 

            rescue NFTStorage::ApiError => e
              puts "Error when calling NFTStorageAPI->store: #{e}"
        end
    end
end
