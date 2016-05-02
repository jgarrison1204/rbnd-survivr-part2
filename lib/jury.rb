
class Jury
  attr_accessor :members

  #creates an empty array that will hold members(instances of class Contestant) of the Jury
  #create an empty hash that will hold finalists and total_votes
  def initialize
    @members = []
    @vote_counter_hash = {}
  end

  #pushs contestants who have been elminated from the merged tribe to the @members array
  def add_member(juror)
    @members << juror
    puts "#{juror.name.capitalize} has been eliminated and is now on the Jury.".red
  end

  #Passes in an array of two strings (names of finalists).  Loops the names of finalists as the key of the @vote_counter_hash
  #and sets the value of vote_counter_hash to 0.  Must be integer because we will increment later.
  #Loops through members array (filled with instances of class Contestant) and randomly assigns jury member to vote for finalist.
  #Increments the value of each finalist randomly selectd with finalist_voted_for
  def cast_votes(finalists)
    finalists.each {|finalist| @vote_counter_hash[finalist] = 0}
    @members.each do |juror|
      finalist_voted_for = finalists.sample
      puts "#{juror.name.capitalize} voted for #{finalist_voted_for.name.capitalize}".pink
      @vote_counter_hash[finalist_voted_for] += 1
    end
    return @vote_counter_hash
  end

  #iterates through @vote_counter_hash and prints number of votes per finalist
  def report_votes(vote_counter_hash)
    vote_counter_hash.each do |finalist, vote_total|
      puts "#{finalist.name.capitalize} had #{vote_total} votes.".light_blue
    end
  end

  #most_votes holds the highest integer in vote_counter_hash.
  #iterates through vote_counter_hash and returns finalist name of individual who had the most votes.
  def announce_winner(vote_counter_hash)
    winner = ""
    most_votes = vote_counter_hash.values.max
    vote_counter_hash.each {|finalist,vote_total| winner = finalist if vote_total == most_votes}
    puts "#{winner.name.capitalize} is the winner!".blue
    return winner
  end
end
