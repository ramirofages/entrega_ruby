class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @client = Client.find(params[:client_id])  end

  def show  
  end

  # POST
  def new
    @receipt = Receipt.new
    @receipt.client = Client.find(params.require(:client_id))
    @people = Person.pluck(:name, :id)
    
  end

  def edit  
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to client_receipts_path(@receipt.client), notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: url_receipt(@receipt) }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to client_receipts_path(@receipt.client), notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: url_receipt(@receipt) }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:client_id, :person_id, :description, :total_amount, :emission_date)
    end


end
