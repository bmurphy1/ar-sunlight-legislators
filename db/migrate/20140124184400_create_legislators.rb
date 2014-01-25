require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :name_suffix
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :twitter_id
      t.string :birthdate
      t.integer :title_id
      t.integer :state_id
      t.integer :party_id
      t.timestamps
    end
  end
end
