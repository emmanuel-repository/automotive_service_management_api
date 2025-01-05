class MaintenanceService < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenance_services do |t|
      t.string :description, limit: 300, null: false
      t.string :status, limit: 20, null: false
      t.datetime :date, null: false
      t.references :car, null: false, foreign_key: true
      t.string :slug, limit: 100, null: false

      t.timestamps
    end
  end
end
