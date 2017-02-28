class EditCreatePictures < ActiveRecord::Migration[5.0]
    add_column :pictures, :picture, :string
    add_column :pictures, :caption, :text
end
