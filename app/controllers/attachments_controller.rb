class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]
  before_action :set_debt, only: [:index, :new, :create, :edit, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index   
    @attachments = Attachment.all.where(debt_id: @debt.id)
    render :index, layout: false
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new   
    render :new, layout: false
  end

  # GET /attachments/1/edit
  def edit   
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
   
    @attachment.debt = @debt
    
    respond_to do |format|
      if @attachment.save
        @attachments = Attachment.all.where(debt_id: @debt.id)
        format.html { render :index, layout: false, notice: 'O registro foi salvo com sucesso.' }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to debt_attachments_path(@attachment.debt.id), notice: I18n.t(:save_success) }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    @attachments = Attachment.all.where(debt_id: @debt.id)
    respond_to do |format|
      format.html { render :index, layout: false, notice: 'O registro foi removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def set_debt
      @debt = Debt.find(params[:debt_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:name, :description, :file)
    end
end
