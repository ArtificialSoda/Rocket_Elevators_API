class ElevatorsController < InheritedResources::Base

  def index
    @elevators = Elevator.all
  end
  
  private
    def elevator_params
      params.require(:elevator).permit(:column_id, :serial_number, :model, :type, :status, :commissioning_date, :last_inspection_date, :inspection_certificate, :information, :notes)
    end

end
