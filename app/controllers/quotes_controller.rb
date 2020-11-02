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
                format.html { redirect_to @quote, notice: "Save process completed!" }
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
            params.permit(:building_type,
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