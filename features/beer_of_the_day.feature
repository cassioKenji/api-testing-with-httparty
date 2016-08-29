Feature:  Beer of the day

  As a consumer
  I want to be able to get a random beer that is vegan
  Because some people like their beer veggie
  Scenario: Get a random vegan friendly beer
    Given a Beernivore API up and running
    When I make a get in "/beer_of_the_day"
    Then it should return a response with a 200 response code
