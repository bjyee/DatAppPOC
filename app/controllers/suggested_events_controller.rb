class SuggestedEventsController < ApplicationController
  before_action :set_suggested_event, only: [:show, :edit, :update, :destroy]

  # GET /suggested_events
  # GET /suggested_events.json
  def index
    @suggested_events = SuggestedEvent.all
  end

  # GET /suggested_events/1
  # GET /suggested_events/1.json
  def show
  end

  # GET /suggested_events/new
  def new
    @suggested_event = SuggestedEvent.new
  end

  # GET /suggested_events/1/edit
  def edit
  end

  # POST /suggested_events
  # POST /suggested_events.json
  def create
    @suggested_event = SuggestedEvent.new(suggested_event_params)

    respond_to do |format|
      if @suggested_event.save
        format.html { redirect_to @suggested_event, notice: 'Suggested event was successfully created.' }
        format.json { render :show, status: :created, location: @suggested_event }
      else
        format.html { render :new }
        format.json { render json: @suggested_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_events/1
  # PATCH/PUT /suggested_events/1.json
  def update
    respond_to do |format|
      if @suggested_event.update(suggested_event_params)
        format.html { redirect_to @suggested_event, notice: 'Suggested event was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggested_event }
      else
        format.html { render :edit }
        format.json { render json: @suggested_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_events/1
  # DELETE /suggested_events/1.json
  def destroy
    @suggested_event.destroy
    respond_to do |format|
      format.html { redirect_to suggested_events_url, notice: 'Suggested event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_event
      @suggested_event = SuggestedEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggested_event_params
      params.require(:suggested_event).permit(:location_id, :category_id, :what, :when, :datetime_created)
    end
end
