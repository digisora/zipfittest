class AddApiresponseToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :apiresponse, :text
  end
end
