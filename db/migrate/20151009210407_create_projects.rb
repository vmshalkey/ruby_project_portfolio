class CreateProjects < ActiveRecord::Migration
  def change
  	create_table :projects do |t|
  		t.string :name
  		t.string :description
  		t.timestamp null: false
  	end
  end
end
