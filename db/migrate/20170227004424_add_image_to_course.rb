class AddImageToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :caption, :text
    add_column :courses, :picture, :string
  end
end
