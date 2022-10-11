class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({:template => "actor_templates/index.html.erb"})
  end

  def actor
    @id = params.fetch(:id)
    @actor = Actor.where({ :id => @id }).at(0)

    @characters = Character.where({ :actor_id => @id}) 

    render({ :template => "actor_templates/actor.html.erb"})
  end
end
