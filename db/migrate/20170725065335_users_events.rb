class UsersEvents < ActiveRecord::Migration[5.1]
  def change
  	create_table(:users_events) do |t|
  		t.column(:user_id, :integer)
  		t.column(:event_id, :integer)

  		t.timestamps()
  	end
  end
end
