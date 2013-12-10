class HomeController < ApplicationController

  def index
  end

  def new
    number = params[:phone_number]
    respond_to do |format|
      if Home.validate_prefix number
        format.html { redirect_to home_index_path, notice: 'Your number is valid' }
      else
        format.html { redirect_to home_index_path , notice: 'Nomor anda tidak terdaftar' }
      end
    end
  end

  def show
    @vouchers = Voucher.all
  end

  def generate_luhn
    @luhn = Luhn.generate 6
  end
end
