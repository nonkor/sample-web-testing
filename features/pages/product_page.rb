class ProductPage < Page
  include Watirsome

  a :color, -> { @browser.ul(id: 'color_to_pick_list').li(class: 'selected').a }
  button :add_to_cart, text: 'Add to cart'

  def selected_color
    color_a.name
  end

  def add_to_cart
    add_to_cart_button.click
    CartPage.new(@browser)
  end
end
