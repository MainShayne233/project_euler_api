class Attempt < ApplicationRecord
  belongs_to :problem

  def correct?
    problem.correct? self.solution
  end
end
