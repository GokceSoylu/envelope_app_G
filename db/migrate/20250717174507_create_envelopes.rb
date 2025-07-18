class CreateEnvelopes < ActiveRecord::Migration[8.0]
  def change
    create_table :envelopes do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
