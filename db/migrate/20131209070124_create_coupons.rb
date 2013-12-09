class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :voucher_id
      t.integer :usage

      t.timestamps
    end
  end
end
