class Users < ActiveRecord::Migration[5.1]
  def change
  	create_table(:users) do |t|
  		t.column(:name, :varchar)
  		t.column(:Telephone, :integer)
  		t.column(:Email, :varchar)
  		
  		t.timestamps()
  	end
  end
end
