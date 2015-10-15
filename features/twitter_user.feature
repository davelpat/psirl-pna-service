Feature: Show twitter user info

  @Positive @Get @User
  Scenario: Show twitter user
    Given I access the resource url "/1/users/show.json?screen_name=jasonh_n_austin&include_entities=true"
    When I retrieve the results
    Then the status code should be 200
    And it should have the field "name" containing the value "Jason Harmon"
    And it should have the field "id" containing the value "57005215"

  @Positive @Get @User
  Scenario Outline: Show twitter user info
    Given a twitter user whose screen name is <screen name>
    When I get their user info
    Then it should include their <name> and <id>

    Examples:
      | name         | screen name     | id       |
      | Jason Harmon | jasonh_n_austin | 57005215 |