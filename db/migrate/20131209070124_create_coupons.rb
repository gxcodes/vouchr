class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :usage
      t.integer :nominal
      t.timestamps
    end
  end
end
