class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.datetime :intervention_start
      t.datetime :intervention_stop
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
