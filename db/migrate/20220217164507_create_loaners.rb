class CreateLoaners < ActiveRecord::Migration[6.0]
  def change
    create_table :loaners do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :occupation
      t.string :id_type
      t.string :id_number
      t.text :address
      t.boolean :is_verified
      t.string :status

      t.timestamps
    end
  end
end
