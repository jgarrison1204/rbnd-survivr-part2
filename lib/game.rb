class Game
  attr_reader :tribes

  #Splat operator returns an array and allows undefined numbers of data types into array
  def initialize(*tribes)
    @tribes = tribes
    @merged_tribe_array = []
  end

  #Need to push new_tribe into array of objects (borneo which is an instatization of class Game)
  #tribe_three is an object which contains a hash key -> name: value -> "", key -> members: value -> array of Contestant objects
  def add_tribe(new_tribe)
    @tribes << new_tribe
  end

  #Using sample to randomly return an item in the array.  Each item in this array is a Tribe object
  def immunity_challenge
    @tribes.sample
  end

  #Clear is from Core Library and deletes every item in an array.
  def clear_tribes
    @tribes.clear
  end

  #Merge takes an argument as the value to the key name: in the initialize method for class Tribe.
  #@members is an empty array as a place holder to satify the structure of Tribe.
  #Replaced empty array @members with add_merged_contestants_as_values
  #Clear_tribes deletes existing values in @tribes array of tribe objects
  #Calls add_tribe with merged_tribe as an input.  This results in new @tribes with all merged members.
  def merge(name_new_tribe)
    merged_tribe = Tribe.new({name: name_new_tribe, members: add_merged_contestants_as_values})
    clear_tribes
    add_tribe(merged_tribe)
    return @tribes[0]
  end

  #Takes array instanziated at intailize and pushes all members of all tribes into the array
  #Flatten! returns @merged_tribe_array as one dimenesional array of contestants.
  def add_merged_contestants_as_values
    @tribes.each {|tribe_member| @merged_tribe_array << tribe_member.members}
    @merged_tribe_array.flatten!
  end

  #Returns the first item in the #tribes array (merged contestants) calls members methods and uses sample to randomly select the winner
  def individual_immunity_challenge
    contestant_immune_from_elimination = @tribes[0].members.sample
  end
end
