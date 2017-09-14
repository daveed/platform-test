Feature: Delete a user

  Scenario: Delete a user
    Given a user and a token
      | email             | password   | token       |
      | antman@marvel.com | 4ntm4nm4rv | xxx.Yyy.zzz |
    When I do a DELETE request to /v1/user/1
    Then the response status should be "204"
