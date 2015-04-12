Sequel.migration do
  up do
    add_column :questions, :display_order, Numeric, null: false, default: 0
  end

  down do
    drop_column :questions, :display_order
  end
end
