class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
