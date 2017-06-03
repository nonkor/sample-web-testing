class Page
  include Watirsome

  URL = '/'

  def url
    @@base_url + self.class::URL
  end

  def self.base_url=(base_url)
    @@base_url = base_url
  end

  def initialize(browser, goto: false)
    browser.goto url if goto
    super(browser)
  end
end
