class HomeController < ApplicationController

  def index
  end

  def new
    number = params[:phone_number]
    @valid = Home.validate_prefix number
    respond_to do |format|
      if @valid
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
