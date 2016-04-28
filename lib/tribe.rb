class Tribe
  attr_reader :name, :members

  def initialize(tribe_hash)
    @name = tribe_hash[:name]
    @members = tribe_hash[:members]

    puts "Tribe #{@name} has the following members:"
    @members.each do |assign_member_to_tribe|
      puts "#{assign_member_to_tribe}"
    end
  end

  def to_s
    @name
  end

  def tribal_council(options={})
    not_immune_array = @members.delete_if {|immune_member| immune_member == options[:immune]}
    return not_immune_array.sample
  end
end
