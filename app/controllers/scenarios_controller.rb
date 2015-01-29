class ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :edit, :update]

  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = Scenario.new(scenario_params)

    if @scenario.save
      flash[:notice] = "#{@scenario.name} created successfully"
      redirect_to new_scenario_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scenario.update(scenario_params)
      flash[:notice] = "#{@scenario.name} updated successfully"
      redirect_to scenario_path(@scenario)
    else
      render :edit
    end
  end

  def index
    @scenarios = Scenario.all
  end

  def show
  end

  private

  def scenario_params
    params.require(:scenario).permit!
  end

  def set_scenario
    @scenario = Scenario.find_by(slug: params[:id])
  end
  
end