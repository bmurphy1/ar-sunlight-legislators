# 20140124185400
require_relative '../config'

class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.timestamps
    end
  end
end
