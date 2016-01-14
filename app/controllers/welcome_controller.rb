class WelcomeController < ApplicationController
  def index
    $redis.set('Type', 'Movie')
    @type = $redis.get('Type')
    @movies = Movie.all
  end
end
