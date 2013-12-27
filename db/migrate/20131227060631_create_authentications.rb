class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
