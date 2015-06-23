class AddQuestionBody < ActiveRecord::Migration
  def change
    add_column :questions, :body, :text
  end
end
