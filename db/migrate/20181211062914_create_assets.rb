class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets, id: false do |t|
      t.string :id, limit: 5, null: false
      t.datetime :eff_dt, null: false
      t.text :html_string, limit: 65535
      t.integer :ver_nbr, null: false
      t.string :title, limit: 128
      t.string :description, limit: 512

      t.timestamps
    end
    execute "ALTER TABLE assets ADD PRIMARY KEY (id)"
  end
end
