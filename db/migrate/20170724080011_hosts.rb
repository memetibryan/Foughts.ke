class Hosts < ActiveRecord::Migration[5.1]
  def change
  	create_table(:hosts) do |t|
  		t.column(:name, :string)
  		t.column(:Telephone, :integer)
  		t.column(:Email, :varchar)
  		t.column(:Telephone, :integer)

  		t.timestamps()
  	end
  end
end
