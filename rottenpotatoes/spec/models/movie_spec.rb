require 'spec_helper'
require 'rails_helper'
 
describe Movie do
  describe 'search for movies by director' do
    it 'it should return the movies by the same director' do
      #Movie.should_receive(:search_by_director).with('George Lucas')
      movie1 = FactoryGirl.create(:movie, :title => 'Title1', :director => 'George Lucas')
      movie2 = FactoryGirl.create(:movie, :title => 'Title2', :director => 'George Lucas')
      movie3 = FactoryGirl.create(:movie, :title => 'Title3', :director => 'Steven Spielberg')
      movies = Movie.search_by_director('George Lucas')
      expect(movies).to contain_exactly(movie1, movie2)
    end
    it 'it shouldn\'t return any other movies from different directors' do
      #Movie.should_receive(:search_by_director).with('George Lucas')
      movie1 = FactoryGirl.create(:movie, :title => 'Title1', :director => 'George Lucas')
      movie2 = FactoryGirl.create(:movie, :title => 'Title2', :director => 'George Lucas')
      movie3 = FactoryGirl.create(:movie, :title => 'Title3', :director => 'Steven Spielberg')
      movies = Movie.search_by_director('George Lucas')
      expect(movies).not_to include(movie3)
    end  
  
  
  
  end
end

