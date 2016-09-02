Feature:  Health Check

  As a consumer
  I want to be able to check if my provider is up and running
  Because some people like to monitoring things

  Scenario: Get a simple successfully app with application/json as Content-Type
    Given a Beernivore API up and running
    When I make a get in "/health_check" with "application/json" within the "Accept" header
    And it's headers must contain the value "application/json" within the "Content-Type"
    And the response body must contain a "Hash" as the type

  Scenario: Get a simple successfully app with text/plain as Content-Type
    Given a Beernivore API up and running
    When I make a get in "/health_check" with "text/plain" within the "Accept" header
    And it's headers must contain the value "text/plain" within the "Content-Type"
    And the response body must contain a "String" as the type

  Scenario: Get a simple successfully app health check
    Given a Beernivore API up and running
    When I make a get in "/health_check" with "application/json" within the "Accept" header
    Then it should return a response with a 200 response code
    And it's body must contain the value "true" within the "healthy" for "app"
    And it's body must contain the value "success" within the "message" for "app"
    And it's body must contain a Fixnum type within the "uptime" for "app"

  Scenario: Successfully db health check
    Given a Beernivore API up and running
    When I make a get in "/health_check" with "application/json" within the "Accept" header
    Then it should return a response with a 200 response code
    And it's body must contain the value "true" within the "healthy" for "db"
    And it's body must contain the value "connected" within the "message" for "db"
