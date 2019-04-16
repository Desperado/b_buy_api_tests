Feature: Categories API

  Scenario: CRUD Operations with Services API
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/categories"
    Then the response status should be "200"
    And the JSON response root should be object
    And  the JSON response should have "limit" of type numeric and value "10"
    And  the JSON response should have "skip" of type numeric and value "0"
    And I clear the response cache
    And I send and accept JSON
    When I set JSON request body to:
    """
    {
	"id": "anycat5432101",
	"name": "Ruslan New category"
    }
    """
    When I send a POST request to "http://localhost:3030/categories"
    Then the response status should be "201"
    And the JSON response root should be object
    Then the JSON response should have "name" of type string and value "Ruslan New category"
    When I grab "$..id"
    And I send and accept JSON
    And I set JSON request body to:
    """
    {
      "name": "Another New category"
    }
    """
    When I send a PATCH request to "http://localhost:3030/categories/{id}"
    Then the response status should be "200"
    Then the JSON response should have "name" of type string and value "Another New category"
    And I clear the response cache
    And I send and accept JSON
    When I set JSON request body to:
    """
    {
	"id": "anycat5432101",
	"name": "Ruslan New category"
    }
    """
    When I send a POST request to "http://localhost:3030/categories"
    Then the response status should be "400"
    Then the JSON response should have "name" of type string and value "BadRequest"
    Then the JSON response should have "message" of type string and value "Validation error"
    And the JSON response root should be object
    And I send and accept JSON
    When I send a DELETE request to "http://localhost:3030/categories/{id}"
    Then the response status should be "200"
    When I send a DELETE request to "http://localhost:3030/categories/{id}"
    Then the response status should be "404"