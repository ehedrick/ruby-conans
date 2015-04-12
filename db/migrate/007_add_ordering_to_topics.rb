Sequel.migration do
  up do
    add_column :topics, :display_order, Numeric, null: false, default: 0
  end

  down do
    drop_column :topics, :display_order
  end
end
