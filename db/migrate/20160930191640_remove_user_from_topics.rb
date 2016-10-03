class RemoveUserFromTopics < ActiveRecord::Migration
  def change
    remove_reference :topics, :user, index: true, foreign_key: true
  end
end
