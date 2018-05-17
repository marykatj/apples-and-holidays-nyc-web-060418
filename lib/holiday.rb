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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  new_hash = {holiday_name => supply_array}
  holiday_hash[season] = new_hash
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  c1 = holiday_hash[:winter][:christmas].flatten
  c2 = holiday_hash[:winter][:new_years].flatten
  container = c1 + c2
  container
end
 # return an array of all of the supplies that are used in the winter season


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.collect do |season, holidays|
    puts "#{season}:".capitalize
      holidays.collect do |holiday, supplies|
        puts "  #{holiday.to_s.split('_').collect(&:capitalize).join(" ")}: #{supplies.join(", ")}"
      end
  end
   # .split  = s to a and .join a to s.   
end
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

def all_holidays_with_bbq(holiday_hash)
  holiday_hash.collect do |season, holidays|
      holidays.collect do |holiday, supplies|
        holiday if supplies.include?("BBQ")
      end
  end.flatten.compact
end
 #


  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
