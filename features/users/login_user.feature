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
    And the response token should be "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyX2lkIjoxfQ.iuSIB-Zr-xT1DcXwoRGa67pBZnO54p-pI7iRbtJfBgKXMACFjs0dPnvJUsgnVwlZFSpN8CbRhrZ-2mraZ14zVw"
