class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :invite_token
      t.string :topic

      t.timestamps
    end
    add_index :groups, :invite_token, unique: true
  end
end
