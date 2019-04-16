Feature: Services API

  Scenario: CRUD Operations with Services API
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/services"
    Then the response status should be "200"
    And the JSON response root should be object
    And  the JSON response should have "limit" of type numeric and value "10"
    And  the JSON response should have "skip" of type numeric and value "0"
    And I clear the response cache
    And I send and accept JSON
    When I set JSON request body to:
    """
    {
      "name": "My New service"
    }
    """
    When I send a POST request to "http://localhost:3030/services"
    Then the response status should be "201"
    And the JSON response root should be object
    Then the JSON response should have "name" of type string and value "My New service"
    When I grab "$..id"
    And I send and accept JSON
    And I set JSON request body to:
    """
    {
      "name": "Ruslan New service"
    }
    """
    When I send a PATCH request to "http://localhost:3030/services/{id}"
    And the JSON response root should be object
    Then the response status should be "200"
    And the JSON response root should be object
    Then the JSON response should have "name" of type string and value "Ruslan New service"
    And I send and accept JSON
    When I send a DELETE request to "http://localhost:3030/services/{id}"
    Then the response status should be "200"
    When I send a DELETE request to "http://localhost:3030/services/{id}"
    Then the response status should be "404"
