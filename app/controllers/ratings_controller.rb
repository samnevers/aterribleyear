class RatingsController < ApplicationController

  def upvote
    @rating = Ratings.all
  end

end
