class AddDefaultStatusToDoctorsPatients < ActiveRecord::Migration[5.2]
  def change
    change_column :doctors_patients, :status, :integer, :default => 1
  end
end
