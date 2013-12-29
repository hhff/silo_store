class AddContextToUsers < ActiveRecord::Migration
  def change
    add_column :users, :context, :string
  end
end
