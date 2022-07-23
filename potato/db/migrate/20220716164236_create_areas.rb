class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :governor
      t.string :nrc
      t.string :nrf
      t.string :area_name
      t.string :rule_contract
      t.string :data_url
      t.string :area_id
      t.text :description

      t.timestamps
    end
  end
end
