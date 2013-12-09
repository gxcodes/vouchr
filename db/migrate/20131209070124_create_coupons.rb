class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :balance
      t.integer :nominal
      t.timestamps
    end
  end
end
