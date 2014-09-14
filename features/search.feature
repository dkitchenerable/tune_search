@search
Feature: Search songs
  So that I can find a song in the song database
  As a user I want to be able to select songs by song title, album title, or artist title

    
  Scenario: Finding a song by song title
    Given a song exists with the title "Bar" by artist "Foo" on the album "Foo Comes Alive"
    And I am on the search page
    And I fill in "search[title]" with "Bar"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Opener"
    Then I should see "Foo"
    Then I should see "Foo Comes Alive"

  Scenario: Finding a song by album title
    Given a song exists with the title "Bar" by artist "Foo" on the album "Foo Comes Alive In Berlin"
    And a song exists with the title "Bar" by artist "Foo" on the album "Foo Comes Alive In Tokyo"
    And I am on the search page
    And I fill in "search[album_title]" with "Tokyo"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Bar"
    Then I should see "Foo"
    Then I should see "Foo Comes Alive In Berlin"

  Scenario: Finding a song by artist
    Given a song exists with the title "Bar" by artist "Foo" on the album "Foo Comes Alive"
    And a song exists with the title "Bar" by artist "Foo UK" on the album "Foo Comes Alive Tokyo"
    And I am on the search page
    And I fill in "search[artist_name]" with "UK"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Bar"
    Then I should see "Foo UK"
    Then I should see "Foo Comes Alive Tokyo"
