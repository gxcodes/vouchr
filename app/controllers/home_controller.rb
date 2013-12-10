class HomeController < ApplicationController
  def index
  end

  def new
    number = params[:phone_number]
    respond_to do |format|
      if Home.validate_prefix number and Home.validate_prefix number #and Home.length_phone_number number
        format.html { redirect_to @history, notice: 'Your number is valid' }
      else
        format.html { redirect_to home_index_path , notice: 'Nomor anda tidak terdaftar' }
      end
    end
  end

end
