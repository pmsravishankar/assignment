class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs, id: false do |t|
      t.integer :cust_id, limit: 8
      t.integer :ntftn_id, limit: 8
      t.string :loan_nbr, limit: 16
      # t.references :asset, foreign_key: true
      t.references :asset, foreign_key: {to_table: :assets}, type: :string, index: true
      t.string :actv_sts, limit: 1

      t.timestamps
    end
    execute("ALTER TABLE configs ADD CONSTRAINT cust_ntftn_configs_pk PRIMARY KEY (cust_id, ntftn_id);")
  end
end
