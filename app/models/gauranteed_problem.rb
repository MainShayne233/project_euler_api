class GauranteedProblem

  def self.find_by(number:)
    Problem.find_by(number: number) || MissingNumber.new(number: number)
  end

end
