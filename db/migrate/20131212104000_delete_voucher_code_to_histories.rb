class DeleteVoucherCodeToHistories < ActiveRecord::Migration
  def change
    remove_column :histories, :voucher_code
  end
end
