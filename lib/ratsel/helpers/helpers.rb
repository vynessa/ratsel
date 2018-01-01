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

    def self.get_differences(encrypted_message, end_char, offsets)
      @character_map = Ratsel::Cipher.character_map
      differences = []

      4.times do |i|
        diff = (@character_map.index(encrypted_message[i]) -
        @character_map.index(end_char[i]))

        diff -= offsets[i].to_i
        differences[i] = diff.to_s.rjust(2, '0')
      end

      differences
    end

    # Get encryption key
    def self.get_key(differences)
      key_array = []
      differences.each_with_index do |value, index|
        break if index == differences.size - 1
        first_value = value
        second_value = differences[index + 1]

        compare(index, first_value, second_value, key_array, differences)
      end

      "%d%d%d%d" % [
        differences[0],
        differences[1][-1],
        differences[2][-1],
        differences[3][-1]
      ]
    end

    private
    def self.compare(index, first_value, second_value, key_array, differences)
      until first_value.to_i >= 100 || key_array[index]
        until second_value.to_i >= 100 || key_array[index]
          if first_value[1] == second_value[0]
            differences[index] = first_value
            differences[index + 1] = second_value
            key_array[index] = true
          else
            second_value = (second_value.to_i + Ratsel::Cipher.character_map.size).to_s
          end
        end

        second_value = differences[index + 1]
        first_value = (first_value.to_i + Ratsel::Cipher.character_map.size).to_s
      end
    end
  end
end

