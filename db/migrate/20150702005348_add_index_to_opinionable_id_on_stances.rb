class AddIndexToOpinionableIdOnStances < ActiveRecord::Migration
  def change
    add_index :stances, :opinionable_id
  end
end