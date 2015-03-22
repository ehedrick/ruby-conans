Sequel.migration do
  up do
    create_table :questions do
      primary_key :id
      String :text
      String :language
    end
  end

  down do
    drop_table :questions
  end
end
