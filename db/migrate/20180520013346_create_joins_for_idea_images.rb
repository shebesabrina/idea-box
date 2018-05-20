class CreateJoinsForIdeaImages < ActiveRecord::Migration[5.2]
  def change
    create_table :joins_for_idea_images do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
