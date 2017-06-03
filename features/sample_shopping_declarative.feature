@declarative
Feature: Sample shopping [declarative]

  Scenario: Order a blue t-shirt
    Given I have a valid user account
    But I am an unauthenticated guest
    When I open "Automation Practice" webshop
    And I navigate to t-shirts catalog
    And I choose a blue "Faded Short Sleeve T-shirts" t-shirt
    Then I see details about chosen t-shirt
    When I add the t-shirt to the Cart
    And I proceed to checkout
    Then it shows me order summary
    When I attempt to move forward through order wizard
    Then it requires authentication
    When I log in as a registered user
    Then I am able to continue ordering
    When I specify my delivery address
    Then I have to read the terms of service
    When I agree with the terms of service
    Then I have to choose payment method
    When I choose to pay by check
    Then it shows me order details
    When I confirm the order
    Then my order is complete and shipped
