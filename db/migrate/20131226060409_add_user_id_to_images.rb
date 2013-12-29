class AddUserIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :user, :integer
  end
end
