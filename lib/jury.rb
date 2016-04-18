class Jury
  attr_accessor :members

  def initialize
    @members = []
    @finalists = {finalist1: "name", finalist2: "name"}
  end

  def add_member(name)
    @name = name
    @members << @name
  end

  def cast_votes(finalist)
    @finalist = finalist
    @finalists
  end
end

Jury.new.cast_votes("jacob")
