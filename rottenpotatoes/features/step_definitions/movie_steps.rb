Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)  
  # table is a Cucumber::Ast::Table
  #pending # express the regexp above with the code you wish you had
  end
end

When(/^I go to the edit page for "(.*?)"$/) do |movie_name|
 @movie = Movie.find_by(title: movie_name)
 visit edit_movie_path(@movie.id)
end


When(/^I am on the details page for "(.*?)"$/) do |movie_name|
 @movie = Movie.find_by(title: movie_name)
 visit movie_path(@movie.id)
end

# Then(/^I should ben on the Similar Movies page for "(.*?)"$/ ) do |movie_name|
#  search_directors_path(Movie.find_by_title($1).director)
# end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |movie_name, movie_director|
  expect(Movie.find_by(title: movie_name).director).to eq(movie_director)
end