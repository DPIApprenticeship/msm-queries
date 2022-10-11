class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def eldest
    sorted_directors = Director.all.order({ :dob => :asc }).where.not({ :dob => nil })
    @director = sorted_directors.at(0)
    @dob = @director.dob.strftime("%B %d, %Y")
    render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest
    sorted_directors = Director.all.order({ :dob => :desc}).where.not({ :dob => nil})
    @director = sorted_directors.at(0)
    @dob = @director.dob.strftime("%B %d, %Y")
    render({ :template => "director_templates/youngest.html.erb"})
  end
end
