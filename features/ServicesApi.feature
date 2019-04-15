Feature: API

  Scenario: List tweets in JSON
    Given I send and accept JSON
    #When the client requests GET "http://localhost:3030/services"
    When I send a GET request to "http://localhost:3030/services"
    Then the response status should be "200"