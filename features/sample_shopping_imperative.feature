@imperative
Feature: Sample shopping [imperative]

  Scenario: Order a blue t-shirt
    Given I go to "http://automationpractice.com"
    When I click at "T-SHIRTS" menu item
    Then I should be on "T-shirts" page
    And I click at "blue" icon below "Faded Short Sleeve T-shirts" option
    Then I should be on "Faded Short Sleeve T-shirts" page
    And "blue" icon should be selected
    And I click at "Add to cart" button
    And I proceed to checkout
    Then I should be on "SHOPPING-CART SUMMARY" page
    When I proceed to checkout
    Then I should be on "AUTHENTICATION" pages
    When I login as "qashop@mailinator.com" with "autoqa" password
    Then I should be on "ADDRESSES" page
    When I proceed to checkout
    Then I should be on "SHIPPING" page
    When I click at "I agree to the terms of service" checkbox
    And I proceed to checkout
    Then I should be on "PLEASE CHOOSE YOUR PAYMENT METHOD" page
    When I click at "Pay by check" button
    Then I should be on "ORDER SUMMARY" page
    When I click at "I confirm my order" button
    Then I should be on "ORDER CONFIRMATION" page
    And "Payment amount" text should be "$18.51"
