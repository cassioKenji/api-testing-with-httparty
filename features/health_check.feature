Feature:  Health Check

  As a consumer
  I want to be able to check if my provider is up and running
  Because some people like to monitoring things

  Scenario: Get a simple successfully health check
    Given a Beernivore API up and running
    When I make a get in "/health_check"
    Then it should return a response with a 200 response code
    And it's headers must contain the value "application/json" within the "Content-Type"
    And it's body must contain the value "true" within the "healthy" for "app"
    And it's body must contain the value "success" within the "message" for "app"

  Scenario: Successfully db health check
    Given a Beernivore API up and running
    When I make a get in "/health_check"
    Then it should return a response with a 200 response code
    And it's headers must contain the value "application/json" within the "Content-Type"
    And it's body must contain the value "true" within the "healthy" for "db"
    And it's body must contain the value "connected" within the "message" for "db"
