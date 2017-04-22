class RemoveReferenceFromGroups < ActiveRecord::Migration
  def change
    remove_reference :groups, :calendar, index: true, foreign_key: true
  end
end
