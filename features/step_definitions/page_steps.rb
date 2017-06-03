Given(/^I have a valid user account$/) do
  @user = settings[:user]
end

Given(/^I am an unauthenticated guest$/) do
  # dump step, no actions here
end

When(/^I open "Automation Practice" webshop$/) do
  @page = HomePage.new(browser, goto: true)
end

When(/^I navigate to t\-shirts catalog$/) do
  @page = @page.navigate_to_tshirts
end

When(/^I choose a (.+) "([^"]*)" t\-shirt$/) do |color, model|
  @color = color.capitalize
  @page = @page.choose_product(model, color)
end

When(/^I add the t\-shirt to the Cart$/) do
  @page = @page.add_to_cart
end

When(/^I proceed to checkout$/) do
  @page.proceed_to_checkout
end

When(/^I attempt to move forward through order wizard$/) do
  step 'I proceed to checkout'
end

When(/^I specify my delivery address$/) do
  @page.set_address
  step 'I proceed to checkout'
end

When(/^I log in as a registered user$/) do
  @page = @page.sign_in(@user)
end

When(/^I agree with the terms of service$/) do
  @page.agree_with_terms_of_service
  step 'I proceed to checkout'
end

When(/^I choose to pay by check$/) do
  @page.pay_by_check
end

When(/^I confirm the order$/) do
  @page = @page.confirm_order
end

Then(/^I see details about chosen t\-shirt$/) do
  expect(@page.selected_color).to eq(@color)
end

Then(/^it shows me order summary$/) do
  expect(@page.current_step).to eq '01. Summary'
end

Then(/^it requires authentication$/) do
  expect(@page.current_step).to eq '02. Sign in'
  @page = LoginPage.new(@browser)
end

Then(/^I am able to continue ordering$/) do
  expect(@page.current_step).to eq '03. Address'
end

Then(/^I have to read the terms of service$/) do
  expect(@page.current_step).to eq '04. Shipping'
end

Then(/^I have to choose payment method$/) do
  expect(@page.current_step).to eq '05. Payment'
  @total_price = @page.total_price
end

Then(/^it shows me order details$/) do
  expect(@page.amount).to eq @total_price
end

Then(/^my order is complete and shipped$/) do
  expect(@page.notice).to eq 'Your order on My Store is complete.'
end
