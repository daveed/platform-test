Feature: Register a user

  Scenario: Create a user
    Given I send and accept JSON
    When I do a POST request to "/users" with:
      """
      {
        "name": "Chris Shiflett",
        "email": "chris@fender.com",
        "password": "telecaster"
      }
      """
    Then the response status should be 201

  Scenario: Cannot create a user
    Given I send and accept JSON
    When I do a POST request to "/users" with:
      """
      {
        "name": "Chris Shiflett",
        "email": "chris@fender.com"
      }
      """
    Then the response status should be 400
