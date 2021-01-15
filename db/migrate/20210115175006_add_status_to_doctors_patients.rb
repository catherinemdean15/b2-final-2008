class AddStatusToDoctorsPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors_patients, :status, :integer
  end
end
