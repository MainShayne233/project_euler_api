class MissingProblem

  attr_accessor :number

  def initialize(args)
    self.number = args[:number]
  end

  def result_for(solution:)
    return {
      status: 400,
      error: "Sorry, we currently don't have problem ##{self.number}"
    }
  end

end
