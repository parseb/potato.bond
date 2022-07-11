class CreateConsumers < ActiveRecord::Migration[7.0]
  def change
    create_table :consumers do |t|
      t.string :address
      t.string :name
      t.string :pending
      t.string :claimed
      t.string :data_url
      t.string :area_address
      t.string :area_name
      t.string :nft_id
      t.string :area_id

      t.timestamps
    end
  end
end
