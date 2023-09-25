# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "byebug"
ApplicationRecord.transaction do 
    puts 'Resetting id sequences...'
    %w(users polls questions answer_choices responses).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end 

    puts 'Creating seed data...'
    u1 = User.create!(username:'Markov')
    u2 = User.create!(username:'Yuri')
    p1 = Poll.create!(title: 'Cats Poll', author: u1)
    p2 = Poll.create!(title: 'Dogs Poll', author: u2)
    q1 = Question.create!(text: 'Favorite cat?', poll: p1)
    q2 = Question.create!(text: 'Ugliest cat?', poll: p1)
    q3 = Question.create!(text: 'Favorite dog?', poll: p2)
    a1 = AnswerChoice.create!(text: 'Garfield', question: q1)
    a2 = AnswerChoice.create!(text: 'Goldie', question: q1)
    a3 = AnswerChoice.create!(text: 'Neko', question: q2)
    a4 = AnswerChoice.create!(text: 'Mocha', question: q2)
    a5 = AnswerChoice.create!(text: 'Mochi', question: q2)
    a6 = AnswerChoice.create!(text: 'Golden Retriever', question: q3)
    a7 = AnswerChoice.create!(text: 'Husky', question: q3)
    r1 = Response.create!(respondent: u1, answer_choice: a1)
    r2 = Response.create!(respondent: u1, answer_choice: a3)
    r3 = Response.create!(respondent: u2, answer_choice: a2)
    r4 = Response.create!(respondent: u2, answer_choice: a7)


    puts 'Done!'
end

