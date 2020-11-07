class LeadsController < InheritedResources::Base
  skip_before_action :verify_authenticity_token
  #before_action :set_lead, only: [:show, :edit, :update, :destroy]

  def new
    @lead = Lead.new
    respond_to do |format|
        format.html #index.html.erb
        format.json {render json: @lead}
    end
  end

  def index
    @leads = Lead.all
  end

  def show
    @lead = Lead.find(params(:lead))
    send_data(@lead.file_contents,
              type: @lead.content_type,
              filename: @lead.filename)
  end

  def create
    p params
    
    p lead_params
    # attached_file = lead_params.delete(:attached_file)
    # puts "The attached file #{attached_file}"
    # lead_params[:attached_file] = attached_file.read
    # lead_params[:attached_file_path] = attached_file.path
    @lead = Lead.new(lead_params)
    # @lead.attached_file = attached_file.read
    # @lead.attached_file.read     did not work
    
    respond_to do |format|

      if @lead.save
        format.html { redirect_to root_path, notice: "Save process completed!" }
        format.json { render json: @lead, status: :created, location: @lead }
      else
        format.html { 
            flash.now[:notice]="Save proccess coudn't be completed!" 
            render :new 
        }
        format.json { render json: @lead.errors, status: :unprocessable_entity}
      end
    end
  end


  private
    def lead_params
      params.require(:leads).permit(:contact_full_name, :company_name, :email, :phone, :project_name, :project_description, :department, :message, :attached_file, :created_at)
    end

end