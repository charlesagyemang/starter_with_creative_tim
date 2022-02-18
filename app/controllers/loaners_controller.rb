class LoanersController < ApplicationController
  before_action :set_loaner, only: %i[ show edit update destroy ]
  layout 'dashboard'
  
  # GET /loaners or /loaners.json
  def index
    @loaners = Loaner.all
  end

  # GET /loaners/1 or /loaners/1.json
  def show
  end

  # GET /loaners/new
  def new
    @loaner = Loaner.new
  end

  # GET /loaners/1/edit
  def edit
  end

  # POST /loaners or /loaners.json
  def create
    @loaner = Loaner.new(loaner_params)

    respond_to do |format|
      if @loaner.save
        format.html { redirect_to @loaner, notice: "Loaner was successfully created." }
        format.json { render :show, status: :created, location: @loaner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loaner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loaners/1 or /loaners/1.json
  def update
    respond_to do |format|
      if @loaner.update(loaner_params)
        format.html { redirect_to @loaner, notice: "Loaner was successfully updated." }
        format.json { render :show, status: :ok, location: @loaner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loaner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loaners/1 or /loaners/1.json
  def destroy
    @loaner.destroy
    respond_to do |format|
      format.html { redirect_to loaners_url, notice: "Loaner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loaner
      @loaner = Loaner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loaner_params
      params.require(:loaner).permit(:first_name, :last_name, :phone_number, :email, :occupation, :id_type, :id_number, :address, :is_verified, :status)
    end
end
