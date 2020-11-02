class BatteriesController < InheritedResources::Base

  private

    def battery_params
      params.require(:battery).permit(:building_id, :type, :status, :employee_id, :commissioning_date, :last_inspection_date, :operations_certificate, :information, :notes)
    end

end
