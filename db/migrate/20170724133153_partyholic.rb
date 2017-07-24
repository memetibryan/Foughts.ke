class Partyholic < ActiveRecord::Migration[5.1]
  def change
    create_table(:partyholic) do |t|
      t.column(:name, :string)
      t.column(:telephone, :integer)
      t.column(:email, :string)

      t.timestamps()
    end
  end
end
