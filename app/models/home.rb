class Home < ActiveRecord::Base

  def self.validate_phone_number phone_number 
    Luhn.valid? phone_number
  end

  def self.validate_prefix phone_number
    # phone_number[0..3] == '0812' or phone_number[0..3] == '0813'
    phone_number >= 10 && phone_number =~ /^(0812|0813)/
  end

  # def self.length_phone_number phone_number
  #   phone_number.length > 9 and phone_number.length < 13  
  # end
end

