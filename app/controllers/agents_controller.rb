class AgentsController < ApplicationController

  #
  # index
  #
  def index
    @agents = Agent.all
  end

  #
  # show
  #
  def show
    @agent = Agent.find(params[:id])
  end

  #
  # edit
  #
  def edit
    @agent = Agent.find(params[:id])
  end
end
