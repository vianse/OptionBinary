class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :Name
      t.string :Url
      t.string :Image
      t.string :Regulated
      t.string :MinimumDeposit
      t.string :MinimumAmountTrade
      t.string :MaximunAmountTrade
      t.string :Expirations
      t.string :DemoAccount
      t.string :USAFriendly

      t.timestamps null: false
    end
  end
end
