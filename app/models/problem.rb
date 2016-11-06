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
    problem = Problem.find_by(number: params[:number]) || Problem.create
    problem.update_attributes params
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
