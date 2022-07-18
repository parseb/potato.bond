class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.string :data_url
      t.string :farmer_address
      t.string :consumer_address
      t.string :state
      t.string :nft_id
      t.string :area_id
      t.string :price
      t.string :erc_address

      t.timestamps
    end
  end
end