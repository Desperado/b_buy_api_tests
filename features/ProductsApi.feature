Feature: Products API

  Scenario Outline: Verify all products
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/products"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should have <optionality> key "<key>" of type <value type>
    And  the JSON response should have "limit" of type numeric and value "10"
    And  the JSON response should have "skip" of type numeric and value "0"
    Examples:
      | key    | value type | optionality |
      | total  | numeric    | required    |
      | limit  | numeric    | required    |
      | skip   | numeric    | required    |
      | data   | array      | required    |

  Scenario Outline: Verify one existing product and schema
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/products/43900"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should have <optionality> key "<key>" of type <value type>
    Examples:
      | key   | value type | optionality |
      | id    | numeric    | required    |
      | name  | string    | required    |
      | type  | string     | required    |
      | price | numeric     | required    |
      | upc   | string  | required    |
      | shipping   | numeric     | optional    |
      | description   | string     | required    |
      | manufacturer   | string     | required    |
      | model   | string     | required    |
      | url   | string     | required    |
      | image   | string     | required    |
      | createdAt   | string     | required    |
      | updatedAt   | string   | required    |
      | categories   | array     | required    |

  Scenario: Verify one non-existing product and schema
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/products/900000"
    Then the response status should be "404"
    And the JSON response root should be object

  Scenario Outline: Create new product
    Given I send and accept JSON
    When I set JSON request body to:
    """
    {
      "name":  "My New Hoodie",
      "type": "Clothes",
      "upc": "12345676",
      "price": 29.99,
      "description": "The New description",
      "model": "HDI12345"
    }
    """
    When I send a POST request to "http://localhost:3030/products"
    Then the response status should be "201"
    And the JSON response root should be object
    And the JSON response should have <optionality> key "<key>" of type <value type>
    Then the JSON response should have "name" of type string and value "My New Hoodie"
    Then the JSON response should have "price" of type numeric and value "29.99"
    Examples:
      | key   | value type | optionality |
      | id    | numeric    | required    |
      | name  | string    | required    |
      | type  | string     | required    |
      | price | numeric     | required    |
      | description  | string  | required    |
      | model  | string     | required    |
      | updatedAt   | string     | required    |
      | createdAt   | string     | required    |

  Scenario: Verify request of products and description only
    Given I send and accept JSON
    When I send a GET request to "http://localhost:3030/products?$select[]=name&$select[]=description"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should follow "features/schemas/products_name_desc.json"
    Then the JSON response should have "$.data[0].name" of type string and value "Duracell - AAA Batteries (4-Pack)"
    And the JSON response should have "$.data[0].description" of type string and value "Compatible with select electronic devices; AAA size; DURALOCK Power Preserve technology; 4-pack"

  Scenario: Verify request of some TV products with free shipping and price selection from 500 to 800
    Given I send and accept JSON
    When I send a GET request to "localhost:3030/products?category.name=TVs&price[$gt]=500&price[$lt]=800&shipping[$eq]=0"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should follow "features/schemas/products_name_desc.json"
    And the JSON response should have "$.data[0].shipping" of type numeric and value "0"
    And the JSON response should have "$.data[0].categories[1].name" of type string and value "TVs"

  Scenario: Verify price sorting of products
    Given I send and accept JSON
    When I send a GET request to "localhost:3030/products?$sort[price]=1"
    Then the response status should be "200"
    And the JSON response root should be object
    Then the JSON response should have "$.data[0].price" of type numeric and value "0.01"
    When I send a GET request to "localhost:3030/products?$sort[price]=-1"
    Then the response status should be "200"
    And the JSON response root should be object
    Then the JSON response should have "$.data[0].price" of type numeric and value "27999.98"

  Scenario: Verify product filter by category
    Given I send and accept JSON
    When I send a GET request to "localhost:3030/products?category.name=Coffee Pods"
    Then the response status should be "200"
    And the JSON response root should be object
    And the JSON response should have "$.data[0].categories[2].name" of type string and value "Coffee Pods"
