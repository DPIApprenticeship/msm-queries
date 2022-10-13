class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:title)
    @directors = Director.all.order(:name)

    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie
      @id = params.fetch(:id)
      @movie = Movie.where({ :id => @id}).at(0)
      @director = Director.where({ :id => @movie.director_id}).at(0).name
      render({ :template => "movie_templates/movie.html.erb"})
  end

  def new_movie
    title = params.fetch(:title)
    year = params.fetch(:year).to_i
    duration = params.fetch(:duration).to_i
    description = params.fetch(:description).to_i
    image_url = params.fetch(:image_url)
    director_id = params.fetch(:director_id)

    movie_to_add = Movie.new
    movie_to_add.title = title
    movie_to_add.year = year
    movie_to_add.description = description
    movie_to_add.image = image_url
    movie_to_add.director_id = director_id

    movie_to_add.save

    index
  end


  def delete
      @id = params.fetch(:id)
      @movie = Movie.where({ :id => @id}).at(0)
      if (@movie)
        @movie.destroy
      end

      index
  end
end
