class AddInterventionsToElevators < ActiveRecord::Migration[5.2]
  def change
    add_reference :interventions, :elevator, foreign_key: true
  end
end
