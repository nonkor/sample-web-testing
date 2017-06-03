module Helper
  def settings
    YAML.load(File.open('config/settings.yml'))
  end

  def browser
    @browser
  end

  def visit(url)
    browser.goto url
  end
end
