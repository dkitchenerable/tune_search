Given(/^a song exists with the title "(.*?)" by artist "(.*?)" on the album "(.*?)"$/) do |title, artist_name, album_title|
  new_artist = Artist.new
  new_artist.name = artist_name
  new_artist.save

  new_album =  Album.new
  new_album.title = album_title
  new_album.artist = new_artist
  new_album.save

  new_song = Song.new
  new_song.title = title
  new_song.album = new_album
  new_song.save
end

Given(/^I am on the search page$/) do
  visit root_path
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |input_field, input_text|
  fill_in(input_field, :with => input_text)
end

When(/^I click "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |result_text|
  assert page.has_content?(result_text)
end

Then(/^I should see "(.*?)" result$/) do |num_results|
  assert page.has_content?("Displaying #{num_results} Results")
end


Then(/^I should not see "(.*?)"$/) do |num_results|
  assert page.has_content?(" #{num_results} Results ") == false
end

Then(/^result "(.*?)" should be "(.*?)"$/) do |position, result_text|
  assert page.has_content?("#{position} - #{result_text}")
end
