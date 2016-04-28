class Game

  attr_reader :tribes

  #Splat operator returns an array and allows undefined numbers of data types into array
  def initialize(*tribes)
    @tribes = tribes
  end

  #Need to push new_tribe into array of objects (borneo which is an instatization of class Game)
  #tribe_three is an object which contains a hash key -> name: value -> "", key -> members: value -> array of Contestant objects
  def add_tribe(new_tribe)
    @tribes << new_tribe
  end

  #Using sample to randomly returns an item in the array.  Each item in this array is a Tribe object
  def immunity_challenge
    @tribes.sample
  end

  #Clear is from Core Library and deletes every item in an array.
  def clear_tribes
    @tribes.clear
  end

  #Merge takes an argument as the value to the key name: in the initialize method for class Tribe.
  #@members is an empty array as a place holder to satify the structure of Tribe.
  def merge(name_new_tribe)
    merged_tribe = Tribe.new({name: name_new_tribe, members: @members = []})
  end
end
