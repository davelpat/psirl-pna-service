Feature: Show twitter user info

  @Positive @Get @User
  Scenario Outline: Show twitter user info
    Given a twitter user whose screen name is <screen name>
    When I get their user info
    Then it should include their <name> and <id>

    Examples:
      | name         | screen name     | id       |
      | Jason Harmon | jasonh_n_austin | 57005215 |