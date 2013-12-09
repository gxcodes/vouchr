class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.integer :nominal
      t.timestamps
    end
  end
end
