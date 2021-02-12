class CreatePurchaseInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_informations do |t|
      t.string :post_num
      t.integer :prefectures_id
      t.string :municipality
      t.string :address
      t.string :bill_name
      t.string :phone_num
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
