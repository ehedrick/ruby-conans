class Question < Sequel::Model
  many_to_one :guess
end
