class Tribe
  attr_reader :name, :members

  #Sets key to name and value to members from tribe_hash.
  #assign_member_to_tribe prints out each member of the individiual tribes
  def initialize(tribe_hash)
    @name = tribe_hash[:name]
    @members = tribe_hash[:members]

    puts "Tribe #{@name} has the following members:"
    @members.each do |assign_member_to_tribe|
      puts "- #{assign_member_to_tribe}"
    end
  end

  #Overwrites default to_s
  def to_s
    @name
  end

  #Tribal accepts options hash and allows tribal_council to have a default value
  #not_immune_array is an an array of contestants who did not win. @members is an array of contestants passed in through tribe_hash
  #the bloc deletes the contestant who =='s the immune: "contestant"
  #contestant_to_delete randomly selects a members of the not_immune_array to delete
  def tribal_council(options={})
    not_immune_array = @members.delete_if {|contestant| contestant == options[:immune]}
    contestant_to_delete = not_immune_array.sample
    @members.delete(contestant_to_delete)
    return contestant_to_delete
  end
end
