class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item

  before_validation on: :create do |resource|
    resource.send(:initialize_state_machines, dynamic: :force)
  end

  state_machine initial: :pending do
    event :payment_cleared do
      transition pending: :approved
    end

    event :payment_declined do
      transition pending: :rejected
    end
  end

  def order_items
    shopping_cart_items
  end

  def tax_pct
    0.0
  end
end
