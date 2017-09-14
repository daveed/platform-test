Feature: Log a user in

  Scenario: User logs in
    Given I send and accept JSON
    When I do a POST request to "/auth/login" with:
      """
      {
        "email": "troy@fender.com",
        "password": "jazzmaster"
      }
      """
    Then the response status should be 200
