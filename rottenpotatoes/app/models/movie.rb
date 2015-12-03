class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.search_by_director(arg)
    Movie.where(director: arg)
    
  end

end
