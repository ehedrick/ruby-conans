class Question < Sequel::Model
  many_to_one :guess
  many_to_one :topic
end
