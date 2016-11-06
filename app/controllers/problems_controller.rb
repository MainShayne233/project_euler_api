class ProblemsController < ApplicationController

  before_action :get_problem, only: :check

  def check
    render json: {
      status: 200,
      result: @problem.attempt_result(params[:solution]),
      error: nil
    }
  end

  def github
    render json: 'checkout: https://github.com/MainShayne233/project_euler_api'
  end

  private

  def get_problem
    @problem = Problem.find_by number: params[:number]
  end

end
