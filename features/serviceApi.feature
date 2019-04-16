Feature: Verify healthcheck and version API

  Scenario: Basic check of healthcheck API
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/healthcheck"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should follow "features/schemas/healthcheck.json"
    And the JSON response should have key "uptime"
    And  the JSON response should have "readonly" of type boolean and value "false"

  Scenario: Basic check of version API
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/version"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should have key "version"
    And the JSON response should have "version" of type string and value "1.1.0"
