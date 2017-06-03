class HomePage < Page
  include Watirsome  

  a :tshirts, title: 'T-shirts', visible: true

  def navigate_to_tshirts
    tshirts
    TShirtsPage.new(@browser)
  end
end
