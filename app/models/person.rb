class Person < ApplicationRecord
	require "csv"
  	belongs_to :location
  	belongs_to :affiliation

  	validates :first_name, presence: true
  	validates :species, presence: true
  	validates :gender, presence: true


	def self.import(file)
	    CSV.foreach(file.path, headers: true) do |row|
	        new_person = Person.new
	        new_person.first_name = row[0].split(" ", 2)[0].titleize
	        new_person.last_name = row[0].split(" ", 2)[1]&.titleize
	        new_person.species = row[2]
	        new_person.gender = row[3]
	        new_person.weapon = row[5]
	        new_person.vehicle = row[6]

	        loc = Location.find_or_create_by(name: row[1]&.titleize) if !row[1].blank?
	        aff = Affiliation.find_or_create_by(name: row[4]) if !row[4].blank?

			new_person.affiliation = aff
        	new_person.location = loc

	        new_person.save
	    end
	end

	def full_name
		first_name.to_s + " " + last_name.to_s
	end

end
