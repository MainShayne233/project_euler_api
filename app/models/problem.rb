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

  def attempt_result(solution)
    attempts.create solution: solution
    correct?(solution) ? "correct" : "incorrect"
  end

  def correct_attempts
    attempts.where solution: solution
  end

  def incorrect_attempts
    attempts.where.not solution: solution
  end

end
