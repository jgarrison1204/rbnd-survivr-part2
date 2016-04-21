class Jury
  attr_accessor :members

  def initialize
    @members = []
    @finalists_hash = {}
  end

  def add_member(name)
    @name = name
    @members << @name
  end

  def cast_votes(finalists)
    finalists.each {|finalist| @finalists_hash[finalist] = 0}
    @members.each do |member|
      puts "#{member.name} voted for #{finalists.sample}"
      @finalists_hash[finalists.sample] += 1
    end
    return @finalists_hash
  end

  def report_votes(final_votes)
    final_votes.each {|finalist, score| puts "#{finalist}'s Score:#{score}"}
  end

  def announce_winner(final_votes)
    winner = final_votes.max_by { |_, vote| vote }.first
  end
end
