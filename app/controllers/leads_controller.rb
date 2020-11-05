class LeadsController < InheritedResources::Base
  skip_before_action :verify_authenticity_token
  require 'zendesk_api'
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
    @lead = Lead.new(lead_params)

    respond_to do |format|

      if @lead.save
        # Deliver the greeting email
        # UserNotifierMailer.send_greeting_email(@lead).deliver

        # Send Zendesk support ticket
        client = ZendeskAPI::Client.new do |config|
          # Mandatory:
        
          config.url = "https://rocket-elevators-help.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
        
          # Basic / Token Authentication
          config.username = "dimitrov.fabien@gmail.com/token"
        
          # Choose one of the following depending on your authentication choice
          config.token = ENV['zendesk_key']
          # config.password = "your zendesk password"
        
          # OAuth Authentication
          # config.access_token = "your OAuth access token"
        
          # Optional:
        
          # Retry uses middleware to notify the user
          # when hitting the rate limit, sleep automatically,
          # then retry the request.
          config.retry = true
        
          # Raise error when hitting the rate limit.
          # This is ignored and always set to false when `retry` is enabled.
          # Disabled by default.
          config.raise_error_when_rate_limited = false
        
          # Logger prints to STDERR by default, to e.g. print to stdout:
          require 'logger'
          config.logger = Logger.new(STDOUT)
        
          # Changes Faraday adapter
          # config.adapter = :patron
        
          # Merged with the default client options hash
          # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
        
          # When getting the error 'hostname does not match the server certificate'
          # use the API at https://yoursubdomain.zendesk.com/api/v2
        end
         
        p "------------"
        p client
        ZendeskAPI::Ticket.create!(client, :subject => "Test ticket!!!", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")
        
        format.html { redirect_to root_path, notice: "Contact Us form sent!" }
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
