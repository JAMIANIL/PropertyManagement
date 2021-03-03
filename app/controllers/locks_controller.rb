class LocksController < ApplicationController
  before_action :set_lock, only: %i[ show edit update destroy ]

  # GET /locks or /locks.json
  def index
    @locks = Lock.all
  end

  # GET /locks/1 or /locks/1.json
  def show
  end

  # GET /locks/new
  def new
    @lock = Lock.new
  end

  # GET /locks/1/edit
  def edit
  end

  # POST /locks or /locks.json
  def create
    @lock = Lock.new(lock_params)

    respond_to do |format|
      if @lock.save
        format.html { redirect_to @lock, notice: "Lock was successfully created." }
        format.json { render :show, status: :created, location: @lock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locks/1 or /locks/1.json
  def update
    respond_to do |format|
      if @lock.update(lock_params)
        format.html { redirect_to @lock, notice: "Lock was successfully updated." }
        format.json { render :show, status: :ok, location: @lock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locks/1 or /locks/1.json
  def destroy
    @lock.destroy
    respond_to do |format|
      format.html { redirect_to locks_url, notice: "Lock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lock
      @lock = Lock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lock_params
      params.require(:lock).permit(:number, :company_id, :property_id)
    end
end
