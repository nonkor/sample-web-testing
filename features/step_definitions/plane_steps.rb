Given(/^I have a valid user account$/) do
  @user = settings[:user]
end

Given(/^I am an unauthenticated guest$/) do
  # dump step, no actions here
end

When(/^I open "Automation Practice" webshop$/) do
  visit settings[:base_url]
end

When(/^I navigate to t\-shirts catalog$/) do
  browser.a(title: 'T-shirts', visible: true).click
end

When(/^I choose a (.+) "([^"]*)" t\-shirt$/) do |color, model|
  @color = color
  model_list = browser.uls(class: 'product_list')
  model_item = model_list.find do |item|
    item.a(class: 'product-name').text == model
  end
  color_to_pick_list = model_item.ul(class: 'color_to_pick_list').lis
  color_to_pick_item = color_to_pick_list.find do |item|
    item.a.href["color-#{@color}"]
  end
  color_to_pick_item.click
end

When(/^I add the t\-shirt to the Cart$/) do
  browser.button(text: 'Add to cart').click
end

When(/^I proceed to checkout$/) do
  browser.span(text: 'Proceed to checkout', visible: true).click
end

When(/^I attempt to move forward through order wizard$/) do
  step 'I proceed to checkout'
end

When(/^I log in as a registered user$/) do
  browser.text_field(id: 'email').set @user[:email]
  browser.text_field(id: 'passwd').set @user[:password]
  browser.button(id: 'SubmitLogin').click
end

When(/^I specify my delivery address$/) do
  browser.checkbox(label: 'Use the delivery address as the billing address.').set(true)
  step 'I proceed to checkout'
end

When(/^I agree with the terms of service$/) do
  browser.div(id: 'uniform-cgv').click
  step 'I proceed to checkout'
end

When(/^I choose to pay by check$/) do
  browser.a(title: 'Pay by check.').click
end

When(/^I confirm the order$/) do
  browser.span(text: 'I confirm my order').click
end

Then(/^I see details about chosen t\-shirt$/) do
  color_link = browser.ul(id: 'color_to_pick_list').li(class: 'selected').a
  if color_link.name != @color.capitalize
    fail "Selected color: #{color_link.name}, but should be: #{@color.capitalize}"
  end
end

Then(/^it shows me order summary$/) do
  expected_step = '01. Summary'
  current_step = browser.li(class: 'step_current').text
  if current_step != expected_step
    fail "Current step of ordering: '#{current_step}', but should be: '#{expected_step}'"
  end
end

Then(/^it requires authentication$/) do
  expected_step = '02. Sign in'
  current_step = browser.li(class: 'step_current').text
  if current_step != expected_step
    fail "Current step of ordering: '#{current_step}', but should be: '#{expected_step}'"
  end
end

Then(/^I am able to continue ordering$/) do
  expected_step = '03. Address'
  current_step = browser.li(class: 'step_current').text
  if current_step != expected_step
    fail "Current step of ordering: '#{current_step}', but should be: '#{expected_step}'"
  end
end

Then(/^I have to read the terms of service$/) do
  expected_step = '04. Shipping'
  current_step = browser.li(class: 'step_current').text
  if current_step != expected_step
    fail "Current step of ordering: '#{current_step}', but should be: '#{expected_step}'"
  end
end

Then(/^I have to choose payment method$/) do
  expected_step = '05. Payment'
  current_step = browser.li(class: 'step_current').text
  if current_step != expected_step
    fail "Current step of ordering: '#{current_step}', but should be: '#{expected_step}'"
  end
  @total_price = browser.span(id: 'total_price').text
end

Then(/^it shows me order details$/) do
  amount = browser.span(id: 'amount').text
  if amount != @total_price
    fail "Total price: '#{amount}', but should be: '#{@total_price}'"
  end
end

Then(/^my order is complete and shipped$/) do
  notice = browser.p(class: 'alert-success').text
  expected_notice = 'Your order on My Store is complete.'
  if notice != expected_notice
    fail "I should see notice about successful order: '#{expected_notice}', but it's shown: '#{notice}'"
  end
end
