class PhoneNumber 
  require "luhn"

  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def telkomsel? 
    phone_number =~ /^(0812|0813)/
  end

  def luhn_valid?
    Luhn.valid? phone_number, 10
  end

  def length_valid?
    phone_number.length >= 10
  end

  def valid?
    telkomsel? && length_valid? && luhn_valid?
  end

  def self.change_coupon_code coupon_code
    coupon_code.gsub(/\s/, '')
  end
end

