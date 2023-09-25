# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  text        :string           not null
#  question_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord
    belongs_to( :question,
        class_name: :Question,
        primary_key: :id,
        foreign_key: :question_id
    )
    has_many( :responses,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :Response,
        dependent: :destroy
    )
end
