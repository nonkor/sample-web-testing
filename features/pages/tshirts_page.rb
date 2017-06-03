class TShirtsPage < Page
  include Watirsome

  ul :model_list, class: 'product_list'

  li :model, ->(model_name) do
    model_list_ul.lis.find do |item|
      item.a(class: 'product-name').text == model_name
    end
  end

  ul :color_to_pick_list, ->(model_name) do
    model_li(model_name).ul(class: 'color_to_pick_list')
  end

  li :color_to_pick, ->(model_name, color) do
    color_to_pick_list_ul(model_name).lis.find do |item|
      item.a.href["color-#{color}"]
    end
  end

  def choose_product(model_name, color)
    color_to_pick_li(model_name, color).click
    ProductPage.new(@browser)
  end
end
