# 20140124185000
require_relative '../config'

class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :name
      t.timestamps
    end
  end
end
