class Order < ApplicationRecord

  has_many :join_order_to_carts, dependent: :destroy
  has_many :items, through: :join_order_to_carts

  after_create :thanks_order_send

   def thanks_order_send
     OrderMailer.thanks_order_email(self).deliver_now
   end

end
