module Ratsel
  class Helpers
    # Get offsets array from the date of message transmission
    def self.offsets_array(date)
      offsets_array = []
      date_square = date.to_i ** 2
      new_str = date_square.to_s.reverse
      new_str = new_str.slice!(0..3).reverse.split('')

      new_str.each { |str| offsets_array << str.to_i }

      offsets_array
    end

    # Get offsets from generated key
    def self.rotation_array(key)
      key_rotor_array = [] 
      key_array = key.split('')
        
      4.times { key_rotor_array << (key_array.shift + key_array[0]).to_i }

      key_rotor_array
    end

    # Sum of A - n rotation and A - n offsets
    def self.sum_rotation_offset(offsets, rotation_array)
      sum_array = []
      @offsets_array = offsets
      @rotation_array = rotation_array

      4.times { sum_array << @offsets_array.shift + @rotation_array.shift }

      sum_array
    end
  end
end

