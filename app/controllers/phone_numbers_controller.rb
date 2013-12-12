class PhoneNumbersController < ApplicationController
  require 'luhn'

  def index
  end

  def new
    @phone_number = PhoneNumber.new params[:phone_number]
    respond_to do |format|
      if @phone_number.valid?
        format.html { redirect_to phone_number_index_path }
        format.js
      else
        format.html { redirect_to phone_number_index_path }
        format.js
      end
    end
  end

  def show
    @vouchers = Voucher.all
    render "_show"
  end

  def generate_luhn
    @luhn = Luhn.generate 10, prefix: '0812', mod: 10
  end

  def coupon_validate
    respond_to do |format|
      if @coupon = Coupon.where('code = ? and balance >= ?',params[:coupon_code].gsub(/\s/, ''), params[:coupon][:nominal])
        format.js
      else
        format.js
      end
    end
  end
end
