class RenamePrefecturesIdColumnToPurchaseInformations < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchase_informations, :prefectures_id, :prefecture_id
  end
end
