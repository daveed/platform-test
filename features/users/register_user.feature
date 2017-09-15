Feature: Register a user

  Scenario: Create a user
    Given I send and accept JSON
    When I do a POST request to "/users" with:
      """
      {
        "email": "jimi@fender.com",
        "password": "stratocaster"
      }
      """
    Then the response status should be 201
