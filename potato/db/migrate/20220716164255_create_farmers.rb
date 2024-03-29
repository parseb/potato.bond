class CreateFarmers < ActiveRecord::Migration[7.0]
  def change
    create_table :farmers do |t|
      t.string :address
      t.string :gps
      t.string :name
      t.string :amount_issued
      t.string :amount_fulfilled
      t.string :referred_by
      t.string :farmsize
      t.string :data_url
      t.string :area_address
      t.string :nft_id
      t.string :area_id
      t.text :description

      t.timestamps
    end
  end
end
