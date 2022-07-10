class AddAreanameToConsumer < ActiveRecord::Migration[7.0]
  def change
    add_column :consumers, :area_name, :string
  end
end
