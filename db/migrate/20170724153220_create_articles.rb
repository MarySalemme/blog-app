# Migrations are Ruby classes that are designed to make it simple to create and modify database tables.
# Rails uses rake commands to run migrations, and it's possible to undo a migration after
# it's been applied to your database


class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
