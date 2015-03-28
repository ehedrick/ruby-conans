Sequel.migration do
  up do
    create_table :guesses do
      primary_key :id
      String :text
      String :ip_address
      foreign_key :question_id, :questions
    end
  end

  down do
    drop_table :guesses
  end
end
