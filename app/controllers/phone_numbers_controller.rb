class PhoneNumbersController < ApplicationController
  require 'luhn'
  before_action :change_coupon, only: [:coupon_validate]

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

  def seeds
    @luhn = []     
    20.times do
       prefix = ['0812', '0813']
      @luhn << Luhn.generate(10, prefix: prefix.sample, mod: 10)
    end
    @luhn
  end

  def coupon_validate
    respond_to do |format|
      if @coupon = Coupon.where('code = ? and balance >= ?', @coupon_code , params[:coupon][:nominal]).first
         @coupon.balance -= params[:coupon][:nominal].to_i
         if @coupon.balance == 0
           @coupon.destroy
         else
           @coupon.save
         end
         @history = History.new phone_number: params[:phone_number], coupon_code: @coupon_code, nominal_usage: params[:coupon][:nominal], date: Time.now
         @history.save
        format.js
      else
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def change_coupon
      @coupon_code = PhoneNumber.change_coupon_code params[:coupon_code]
    end
end
