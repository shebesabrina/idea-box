class CreateIdeaImages < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_images do |t|
      t.references :idea, foreign_key: true
      t.references :image

      t.timestamps
    end
  end
end
