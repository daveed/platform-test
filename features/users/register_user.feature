Feature: Register a user

  Scenario: Create a user
    Given a user
      | name       | email             | password   |
      | Scott Lang | antman@marvel.com | 4ntm4nm4rv |
    When I do a POST request to /v1/users
    Then the response status should be "201"
