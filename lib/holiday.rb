require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  y = 0
  foo = 0
  holiday_hash.each do |season, holiday|
    if season == :summer
      holiday.each do |holiday, attributes|
        attributes.each do |x|
          if y == 1
            foo = x
          end
          y += 1
        end
      end
    end
  end
  foo
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each {|holiday, attributes| attributes << supply}
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each {|holiday, attributes| attributes << supply}
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, attributes|
        attributes.each {|supply| supplies << supply}
      end
    end
  end
  supplies
end

def all_supplies_in_holidays(holiday_hash)
  foo = ""
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |holiday, attributes|
      holiday = holiday.to_s
      if (holiday).include? "_"
        holiday = holiday.split "_"
        holiday = holiday.map {|x| x.capitalize}
        holiday = holiday.join(" ")
        puts "  #{holiday}: #{(attributes * ", ")}"
      else
        puts "  #{holiday.capitalize}: #{(attributes * ", ")}"
      end
    end
  end
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

end

def all_holidays_with_bbq(holiday_hash)
  h_with_bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, attributes|
      attributes.each do |supply|
        if supply == "BBQ"
          h_with_bbq << holiday
        end
      end
    end
  end
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  h_with_bbq
end
