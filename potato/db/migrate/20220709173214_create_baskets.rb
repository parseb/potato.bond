class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.string :data_url
      t.string :farmer_address
      t.string :customer_address
      t.string :state
      t.string :nft_id

      t.timestamps
    end
  end
end
