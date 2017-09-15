Feature: Delete a user

  Scenario: Delete a user
    Given I send and accept JSON using Bearer "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoyfQ.O8gkQJRE65ejgoCN9Ndok9wdQC4jREJMq0mbSL_IudTUYsGjs7D4qPqhUNwpuWZHwzzO2Cud1F0IT4ODonk4gw"
    When I do a DELETE request to "/users/2" with:
      """
      {
        "email": "jimi@fender.com"
      }
      """
    Then the response status should be 200

  Scenario: Cannot delete a user
    Given I send and accept JSON using Bearer "aaa.bbb.ccc"
    When I do a DELETE request to "/users/2" with:
      """
      {
        "email": "jimi@fender.com"
      }
      """
    Then the response status should be 401
