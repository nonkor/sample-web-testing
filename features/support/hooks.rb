Before do |_scenario|
  @browser ||= Watir::Browser.new(settings[:browser])
  Page.base_url = settings[:base_url] if defined?(Page)
end

After do |scenario|
  if @browser
    if ENV['DEBUG'] || scenario.failed?
      encoded_img = @browser.screenshot.base64
      embed "data:image/png;base64,#{encoded_img}",'image/png'
    end
  else
    puts "Screenshot cannot be captured because browser isn't launched"
  end
end
