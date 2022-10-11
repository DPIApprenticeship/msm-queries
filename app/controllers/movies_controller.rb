class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie
    @id = params.fetch(:id)
    @movie = Movie.where({ :id => @id}).at(0)
    @director = Director.where({ :id => @movie.director_id}).at(0).name
    render({ :template => "movie_templates/movie.html.erb"})
  end

  def delete
      @id = params.fetch(:id)
      @movie = Movie.where({ :id => @id}).at(0)
      @movie.destroy

      index
  end
end
