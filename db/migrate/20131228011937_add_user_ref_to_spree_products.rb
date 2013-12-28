class AddUserRefToSpreeProducts < ActiveRecord::Migration
  def change
    add_reference :spree_products, :user, index: true
  end
end
