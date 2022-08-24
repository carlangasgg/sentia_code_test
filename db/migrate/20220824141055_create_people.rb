class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliations do |t|
      t.string :name
    end

    create_table :locations do |t|
      t.string :name
    end

    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :species
      t.string :gender
      t.string :weapon
      t.string :vehicle

      t.belongs_to :affiliation, index: true
      t.belongs_to :location, index: true
    end
  end
end
