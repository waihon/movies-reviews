class SearchActorController < ApplicationController
  def new 
  end

  def create
    @actor = Actor.find_by(name: params[:name])
    if @actor
      redirect_to @actor 
    else
      redirect_to new_search_actor_url, alert: "Actor not found!"
    end
  end
end