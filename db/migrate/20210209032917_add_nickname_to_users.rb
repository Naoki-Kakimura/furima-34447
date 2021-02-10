class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :first_name_kan, :string
    add_column :users, :last_name_kan, :string
    add_column :users, :first_name_kata, :string
    add_column :users, :last_name_kata, :string
    add_column :users, :birthday, :date
  end
end
