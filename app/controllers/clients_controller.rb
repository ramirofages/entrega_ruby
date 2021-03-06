class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_genders, only: [:new, :edit ]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    
    @revenue_by_year          = @client.total_revenue_by_year
    @receipts_amount_by_month = @client.receipts_amount_by_month
    @personas_facturadas      = @client.personas_mas_facturadas(5)
    
    now = Time.now.utc
    @age = now.year - @client.birth_date.year - (@client.birth_date.to_time.change(:year => now.year) > now ? 1 : 0)
  end


  def new
    @client = Client.new  end


  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        set_genders
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        set_genders
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def set_genders
      @genders = [["Masculino","M"],["Femenino","F"]]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :birth_date, :gender, :document_number, :cuit, :email, :phone_number, :skype)
    end
end
