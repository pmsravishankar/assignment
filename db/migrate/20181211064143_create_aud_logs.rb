class CreateAudLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :aud_logs, id: false do |t|
      t.integer :rec_id, limit: 8
      t.datetime :sent_dttm, null: false
      # t.references :asset, foreign_key: true
      t.references :asset, foreign_key: {to_table: :assets}, type: :string, index: true
      t.integer :cust_id, limit: 8
      t.string :loan_nbr, limit: 16
      t.string :chnl, limit: 16
      t.string :view_sts, limit: 1, default: '0'
      t.string :sent_to, limit: 128
      t.string :del_flg, limit: 1, default: '0'
      t.integer :ver_nbr
      t.datetime :asset_eff_dt

      t.timestamps
    end
    execute("ALTER TABLE aud_logs ADD CONSTRAINT aud_logs_pk PRIMARY KEY (rec_id, sent_dttm);")
  end
end
