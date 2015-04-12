Sequel.migration do
  up do
    create_table :topics do
      primary_key :id
      String :title
      String :description
    end
    alter_table :questions do
      add_foreign_key :topic_id, :topics
    end
  end

  down do
    drop_column :questions, :topic_id
    drop_table :topics
  end
end
