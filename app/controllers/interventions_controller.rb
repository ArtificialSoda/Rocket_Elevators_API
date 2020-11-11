class InterventionsController < InheritedResources::Base

  private

    def intervention_params
      params.require(:intervention).permit(:intervention_start, :intervention_stop, :result, :report, :status, :elevator_id)
    end

end
