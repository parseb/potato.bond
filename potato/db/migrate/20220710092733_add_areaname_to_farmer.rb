class AddAreanameToFarmer < ActiveRecord::Migration[7.0]
  def change
    add_column :farmers, :area_name, :string
  end
end
