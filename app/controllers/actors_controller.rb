class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({:template => "actor_templates/index.html.erb"})
  end
end
