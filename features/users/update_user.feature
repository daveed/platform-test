Feature: Update a user

  Scenario: Update user
    Given a user and a token
      | email             | password   | token       |
      | antman@marvel.com | 4ntm4nm4rv | xxx.Yyy.zzz |
    When I do a POST request to the user id /v1/user/1
    Then the response status should be "204"
