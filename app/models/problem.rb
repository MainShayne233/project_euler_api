class Problem < ApplicationRecord

  has_many :attempts

  def self.import!
    File.read('./app/data/solutions.txt')
        .split("\n")
        .map    { |line|    line.split(' ')                           }
        .select { |line|    line.size == 2                            }
        .map    { |line|    {number: line[0].to_i, solution: line[1]} }
        .each   { |params|  Problem.create_or_update(params)          }
  end

  def self.create_or_update(params)
    problem = Problem.find_by(number: params[:number], missing_problems: false)
    problem.update_attributes params
  end

  def self.find_by(number:, missing_problems: true)
    if missing_problems
      super(number: number) || MissingProblem.new(number: number)
    else
      super(number: number)
    end
  end


  def correct?(solution)
    self.solution == solution
  end

  def result_for(solution:)
    attempts.create solution: solution
    return {
      status: 200,
      result: correct?(solution) ? "correct" : "incorrect",
      error: nil
    }
  end

end
