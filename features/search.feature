@search
Feature: Search songs
  So that I can find a song in the song database
  As a user I want to be able to select songs by song title, album title, or artist title

    
  Scenario: Finding a song by song title
    Given a song exists with the title "Bar" by artist "Foo" on the album "FooBar Comes Alive"
    And I am on the search page
    And I fill in "search[title]" with "Bar"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Bar"
    Then I should see "Foo"
    Then I should see "FooBar Comes Alive"

  Scenario: Finding a song filtering by album title
    Given a song exists with the title "Bar" by artist "Foo" on the album "FooBar Comes Alive In Berlin"
    And a song exists with the title "Bar" by artist "Foo" on the album "FooBar Comes Alive In Tokyo"
    And I am on the search page
    And I fill in "search[album_title]" with "Tokyo"
    And I fill in "search[title]" with "Bar"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Bar"
    Then I should see "Foo"
    Then I should see "FooBar Comes Alive In Tokyo"
    Then I should not see "FooBar Comes Alive In Berlin"

  Scenario: Finding a song filtering by artist
    Given a song exists with the title "Bar" by artist "Foo" on the album "FooBar Comes Alive Berlin"
    And a song exists with the title "Bar" by artist "Foo UK" on the album "FooBar Comes Alive Tokyo"
    And I am on the search page
    And I fill in "search[artist_name]" with "UK"
    And I fill in "search[title]" with "Bar"
    When I click "Search"
    Then I should see "1" result
    Then I should see "Bar"
    Then I should see "Foo UK"
    Then I should see "FooBar Comes Alive Tokyo"
    Then I should not see "FooBar Comes Alive In Berlin"

  Scenario: Finding all songs by an artist
    Given a song exists with the title "Bar1" by artist "Foo" on the album "FooBar Comes Alive"
    And a song exists with the title "Bar2" by artist "Foo" on the album "FooBar Comes Alive Tokyo"
    And I am on the search page
    And I fill in "search[artist_name]" with "Foo"
    When I click "Search"
    Then I should see "2" result
    Then I should see "Bar1"
    Then I should see "Bar2"
    Then I should see "Foo"
    Then I should see "FooBar Comes Alive Tokyo"
    Then I should see "FooBar Comes Alive"

  Scenario: Finding all songs on an album
    Given a song exists with the title "Bar1" by artist "Foo" on the album "FooBar Comes Alive"
    And a song exists with the title "Bar2" by artist "Foo" on the album "FooBar Comes Alive"
    And I am on the search page
    And I fill in "search[album_title]" with "FooBar Comes Alive"
    When I click "Search"
    Then I should see "2" result
    Then I should see "Bar1"
    Then I should see "Bar2"
    Then I should see "Foo"
    Then I should see "FooBar Comes Alive"    
    Then I should see "FooBar Comes Alive"

  Scenario: a keyword search matching artist, title, and album with title showing first, album second, artist third
    Given a song exists with the title "FooBar1 Song" by artist "Bar" on the album "Album"
    And a song exists with the title "Track 1" by artist "FooBar1 Artist" on the album "Album2"
    And a song exists with the title "Track 2" by artist "Foo" on the album "FooBar1 Album"
    And I am on the search page
    And I fill in "search[keywords]" with "FooBar1"
    When I click "Search"
    Then I should see "3" result
    Then result "1" should be "FooBar1 Song"
    Then result "2" should be "Track 2"
    Then result "3" should be "Track 1"
