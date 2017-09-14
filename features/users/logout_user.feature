Feature: Log a user out

  Scenario: User logs out
    Given valid credentials
      | email             | password   | token       |
      | antman@marvel.com | 4ntm4nm4rv | xxx.Yyy.zzz |
    When I do a DELETE request to /v1/logout
    Then the response status should be "200"
