class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :owner
      t.string :nrc
      t.string :nrf
      t.string :area_name
      t.string :rules_address
      t.string :data_url
      t.string :area_id

      t.timestamps
    end
  end
end
