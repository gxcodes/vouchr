class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :phone_number
      t.string :coupon_code
      t.integer :nominal_usage
      t.string :date
      t.string :voucher_code

      t.timestamps
    end
  end
end
