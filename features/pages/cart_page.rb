class CartPage < Page
  span :proceed_to_checkout, text: 'Proceed to checkout', visible: true
  checkbox :use_delivery_address, label: 'Use the delivery address as the billing address.'
  div :terms_of_service, id: 'uniform-cgv'
  a :pay_by_check, title: 'Pay by check.'
  span :confirm_order, text: 'I confirm my order'
  li :current_step, class: 'step_current'
  span :total_price, id: 'total_price'
  span :amount, id: 'amount'

  def proceed_to_checkout
    proceed_to_checkout_span.click
  end

  def set_address
    self.use_delivery_address = true
  end

  def agree_with_terms_of_service
    terms_of_service_div.click
  end

  def pay_by_check
    pay_by_check_a.click
  end

  def current_step
    current_step_li.text
  end

  def total_price
    total_price_span.text
  end

  def amount
    amount_span.text
  end

  def confirm_order
    confirm_order_span.click
    OrderDetailsPage.new(@browser)
  end
end
