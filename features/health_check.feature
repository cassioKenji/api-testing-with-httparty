Feature:  Health Check

  As a consumer
  I want to be able to check if my provider is up and running
  Because some people like to monitoring things

  Scenario: Get a simple successfully health check
    Given a Beernivore API up and running
    When I make a get in "/health_check"
    Then it should return a response with a 200 response code
