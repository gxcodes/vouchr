class Coupon < ActiveRecord::Base
  after_initialize :init
  def init
      self.usage  ||= 0
    end
end
