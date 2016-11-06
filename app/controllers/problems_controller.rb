class ProblemsController < ApplicationController

  before_action :get_problem, only: :check

  def check
    render json: @problem.result_for(solution: params["solution"])
  end

  def github
    render json: 'checkout: https://github.com/MainShayne233/project_euler_api'
  end

  private

  def get_problem
    @problem = GauranteedProblem.find_by number: params[:number]
  end

end
