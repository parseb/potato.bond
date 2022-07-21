class CreateGlobalStates < ActiveRecord::Migration[7.0]
  def change
    create_table :global_states do |t|
      t.string :gid
      t.string :fetchables

      t.timestamps
    end
  end
end
