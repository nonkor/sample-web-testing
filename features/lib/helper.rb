module Helper
  def settings
    @settings ||= YAML.load(File.open('config/settings.yml'))
  end

  def launch_browser(options = {})
    browser_name = settings[:browser_name]

    case browser_name
    when :chrome
      options[:prefs] ||= { credentials_enable_service: false, profile: { password_manager_enabled: false } }
      #options[:switches] ||= %w(--headless --disable-gpu --remote-debugging-port=9222)
    when :firefox
      unless options[:profile]
        options[:profile] = Selenium::WebDriver::Firefox::Profile.new
        options[:profile]['dom.webnotifications.enabled'] = false
      end
    end

    @browser = Watir::Browser.new browser_name, options
  end

  def browser
    @browser
  end

  def visit(url)
    browser.goto url
  end
end
