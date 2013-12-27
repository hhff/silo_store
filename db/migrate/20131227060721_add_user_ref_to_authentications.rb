class AddUserRefToAuthentications < ActiveRecord::Migration
  def change
    belongs_to :authentications, :user, index: true
  end
end
