Feature: Log a user in

  Scenario: User logs in
    Given valid credentials
      | email             | password   |
      | antman@marvel.com | 4ntm4nm4rv |
    When I do a POST request to /v1/login
    Then the response status should be "200"
