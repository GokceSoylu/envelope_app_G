class EnvelopesController < ApplicationController
  before_action :set_envelope, only: %i[ show edit update destroy ]

  # GET /envelopes or /envelopes.json
  def index
    @envelopes = Envelope.all
  end

  # GET /envelopes/1 or /envelopes/1.json
  def show
  end

  # GET /envelopes/new
  def new
    @envelope = Envelope.new
  end

  # GET /envelopes/1/edit
  def edit
  end

  # POST /envelopes or /envelopes.json
  def create
    @envelope = Envelope.new(envelope_params)

    respond_to do |format|
      if @envelope.save
        format.html { redirect_to @envelope, notice: "Envelope was successfully created." }
        format.json { render :show, status: :created, location: @envelope }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @envelope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envelopes/1 or /envelopes/1.json
  def update
    respond_to do |format|
      if @envelope.update(envelope_params)
        format.html { redirect_to @envelope, notice: "Envelope was successfully updated." }
        format.json { render :show, status: :ok, location: @envelope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @envelope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envelopes/1 or /envelopes/1.json
  def destroy
    @envelope.destroy!

    respond_to do |format|
      format.html { redirect_to envelopes_path, status: :see_other, notice: "Envelope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envelope
      @envelope = Envelope.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def envelope_params
      params.expect(envelope: [ :name, :amount ])
    end
end
