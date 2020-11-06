class QuotesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_quote, only: [:show, :edit, :update, :destroy]
  
    
    # GET /quotes
    # GET /quotes.json
    def index
        @quotes = Quote.all
    end

    
    # GET /quotes/1
    # GET /quotes/1.json
    def show
    end
  
    
    # GET /quotes/new
    def new
        @quote = Quote.new
        respond_to do |format|
            format.html #quotes.html.erb
            format.json {render json: @quote}
        end
    end

    # GET /quotes/1/edit
    def edit
    end

    
    # POST /create/quote
    # POST /create/quote.json
    def create 
        @quote = Quote.new(params[:quote])

        
        


        respond_to do |format|
            @quote.update!(quote_params)
            # p '------------------'
            # p '------------------'
            # p @quote
            # p '------------------'
            # p '------------------'
            if @quote.save 

                        # Send support ticket (Zendesk API)
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
            
                ZendeskAPI::Ticket.create!(client, :subject => "Quote from #{@quote.full_name}", :comment => { :value => """ 
                    
                    A quote, with quote ID ##{@quote.id}, has just been given to a user with the filled-out name of #{@quote.full_name}. 
                    
                    \nThis user is reachable by email at #{@quote.email} and by phone at #{@quote.phone}.

                    \nThis #{@quote.building_type} project of grade #{@quote.product_grade} will require #{@quote.no_of_elevators} elevators and will be priced at #{@quote.total_cost}.
                    
                    """}, :submitter_id => client.current_user.id, :priority => "high"
                )

                format.html { redirect_to @quote, notice: "Quote form completed!" }
                format.json { render json: @quote, status: :created, location: @quote }
            
            else
                format.html { 
                    flash.now[:notice]="Save proccess coudn't be completed!" 
                    render :new 
                }
                format.json { render json: @quote.errors, status: :unprocessable_entity}
            end
        end
    end

    # PATCH/PUT /quotes/1
    # PATCH/PUT /quotes/1.json
    def update
        respond_to do |format|
            if @quote.update(quote_params)
                format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
                format.json { render :show, status: :ok, location: @quote }
            else
                format.html { render :edit }
                format.json { render json: @quote.errors, status: :unprocessable_entity }
            end
        end
    end
    

    
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_quote
            @quotes= Quote.find(params[:id])
        end

        # Allowed parameters
        def quote_params
            params.permit(:full_name,
                            :email,
                            :phone,
                            :building_type,
                            :no_of_appartments, 
                            :no_of_floors, 
                            :no_of_basements, 
                            :no_of_elevators_cages, 
                            :no_of_parking_spaces,
                            :no_of_tenant_companies,
                            :no_of_distinct_businesses,
                            :max_occupants_per_floor,
                            :no_of_elevators,
                            :product_grade,
                            :elevator_cost,
                            :installation_cost,
                            :total_cost
            )
            # params.require(:quote).permit()
        end
end