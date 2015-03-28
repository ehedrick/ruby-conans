Sequel.migration do
  up do
    add_column :guesses, :created_at, DateTime, null:false
  end

  down do
    remove_column :guesses, :created_at
  end
end
