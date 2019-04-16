Feature: API

  Scenario: CRUD Scenario for new store
    Given I send and accept JSON
    And I clear the response cache
    When I set JSON request body to:
    """
    {
	  "name": "My New Store",
      "type": "BigBox",
      "address": "123 Fake St",
      "address2": "",
      "city": "Berlin",
      "state": "BD",
      "zip": "55123",
      "lat": 44.969658,
      "lng": -93.449539,
      "hours": "Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 10-8"
    }
    """
    When I send a POST request to "http://localhost:3030/stores"
    Then the response status should be "201"
    And the JSON response root should be object
    Then the JSON response should have "name" of type string and value "My New Store"
    Then the JSON response should have "city" of type string and value "Berlin"
    When I grab "$..id"
    And I send and accept JSON
    And I set JSON request body to:
    """
    {
      "city": "Brandenburg"
    }
    """
    When I send a PATCH request to "http://localhost:3030/stores/{id}"
    And the JSON response root should be object
    Then the response status should be "200"
    And the JSON response root should be object
    Then the JSON response should have "city" of type string and value "Brandenburg"
    And I send and accept JSON
    When I send a DELETE request to "http://localhost:3030/stores/{id}"
    Then the response status should be "200"
    When I send a DELETE request to "http://localhost:3030/stores/{id}"
    Then the response status should be "404"

