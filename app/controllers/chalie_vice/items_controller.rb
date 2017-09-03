class ChalieVice::ItemsController < ApplicationController
  before_action :set_chalie_vice_item, only: [:show, :edit, :update, :destroy]

  # GET /chalie_vice/items
  # GET /chalie_vice/items.json
  def index
    @chalie_vice_items = ChalieVice::Item.all.includes(:item_images).references(:item_images).order('chalie_vice_items.id desc')
  end

  # GET /chalie_vice/items/1
  # GET /chalie_vice/items/1.json
  def show
  end

  # GET /chalie_vice/items/new
  def new
    @chalie_vice_item = ChalieVice::Item.new
  end

  # GET /chalie_vice/items/1/edit
  def edit
  end

  # POST /chalie_vice/items
  # POST /chalie_vice/items.json
  def create
    @chalie_vice_item = ChalieVice::Item.new(chalie_vice_item_params)

    respond_to do |format|
      if @chalie_vice_item.save
        format.html { redirect_to @chalie_vice_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @chalie_vice_item }
      else
        format.html { render :new }
        format.json { render json: @chalie_vice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chalie_vice/items/1
  # PATCH/PUT /chalie_vice/items/1.json
  def update
    respond_to do |format|
      if @chalie_vice_item.update(chalie_vice_item_params)
        format.html { redirect_to @chalie_vice_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @chalie_vice_item }
      else
        format.html { render :edit }
        format.json { render json: @chalie_vice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chalie_vice/items/1
  # DELETE /chalie_vice/items/1.json
  def destroy
    @chalie_vice_item.destroy
    respond_to do |format|
      format.html { redirect_to chalie_vice_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chalie_vice_item
      @chalie_vice_item = ChalieVice::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chalie_vice_item_params
      params.fetch(:chalie_vice_item, {})
    end
end
