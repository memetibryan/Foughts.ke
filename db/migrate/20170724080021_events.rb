class Events < ActiveRecord::Migration[5.1]
  def change
  	create_table(:events) do |t|
  		t.column(:host_id, :integer)
  		t.column(:name, :string)
  		t.column(:description, :string)
  		t.column(:number_of_tickets, :bigint)

  		t.timestamps()
  	end
  end
end
