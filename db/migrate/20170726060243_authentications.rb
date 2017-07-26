class Authentications < ActiveRecord::Migration[5.1]
  def change
  	create_table(:authentications) do |t|
  		t.column(:Email, :text)

  		t.timestamps()
  	end
  end
end
