class AddIdToDoctorsPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors_patients, :id, :primary_key
  end
end
