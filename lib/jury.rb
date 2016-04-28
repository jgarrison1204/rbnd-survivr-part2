class Jury
  attr_accessor :members

  def initialize
    @members = []
    @finalists_hash = {}
  end

  def add_member(juror)
    @members << juror
  end

  def cast_votes(finalist)
    finalist.each {|finalist_ind| @finalists_hash[finalist_ind] = 0}
    @members.each do |juror|
      puts "#{juror} voted for #{finalist.sample}"
      @finalists_hash[finalist.sample] += 1
    end
    return @finalists_hash
  end

  def report_votes(votes)
    votes.each do |finalist, vote_total|
      puts "#{finalist} had #{vote_total} votes."
    end
  end

  def announce_winner(finalists_hash)
    finalists_hash.each do |finalist_ind, vote_total|
      if finalists_hash[finalist_ind] >= 4
        return finalist_ind
      end
    end
  end
end
