# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  answer_choice_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord
    belongs_to( :respondent,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id 
    )
    belongs_to( :answer_choice,
        class_name: :AnswerChoice,
        primary_key: :id,
        foreign_key: :answer_choice_id
    )

    has_one :question, through: :answer_choice, source: :question

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end
end
