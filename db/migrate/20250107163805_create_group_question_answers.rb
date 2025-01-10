# frozen_string_literal: true

class CreateGroupQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_question_answers do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.belongs_to :question, null: false, foreign_key: { to_table: :group_questions }

      t.timestamps
    end
  end
end
