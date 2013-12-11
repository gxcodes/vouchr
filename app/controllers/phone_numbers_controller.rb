class PhoneNumbersController < ApplicationController

  def index
  end

  def new
    @phone_number = PhoneNumber.new params[:phone_number]
    respond_to do |format|
      if @phone_number.valid?
        format.html { redirect_to home_index_path }
        format.js
      else
        format.html { redirect_to home_index_path }
        format.js
      end
    end
  end

  def show
    @vouchers = Voucher.all
    render "_show"
  end

  def generate_luhn
    @luhn = Luhn.generate 6
  end
end
