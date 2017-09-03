class ChalieVice::LettersController < ApplicationController
  before_action :set_chalie_vice_letter, only: [:show, :edit, :update, :destroy]

  # GET /chalie_vice/letters
  # GET /chalie_vice/letters.json
  def index
    @chalie_vice_letters = ChalieVice::Letter.all
  end

  # GET /chalie_vice/letters/1
  # GET /chalie_vice/letters/1.json
  def show
  end

  # GET /chalie_vice/letters/new
  def new
    @chalie_vice_letter = ChalieVice::Letter.new
  end

  # GET /chalie_vice/letters/1/edit
  def edit
  end

  # POST /chalie_vice/letters
  # POST /chalie_vice/letters.json
  def create
    @chalie_vice_letter = ChalieVice::Letter.new(chalie_vice_letter_params)

    respond_to do |format|
      if @chalie_vice_letter.save
        format.html { redirect_to @chalie_vice_letter, notice: 'Letter was successfully created.' }
        format.json { render :show, status: :created, location: @chalie_vice_letter }
      else
        format.html { render :new }
        format.json { render json: @chalie_vice_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chalie_vice/letters/1
  # PATCH/PUT /chalie_vice/letters/1.json
  def update
    respond_to do |format|
      if @chalie_vice_letter.update(chalie_vice_letter_params)
        format.html { redirect_to @chalie_vice_letter, notice: 'Letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chalie_vice_letter }
      else
        format.html { render :edit }
        format.json { render json: @chalie_vice_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chalie_vice/letters/1
  # DELETE /chalie_vice/letters/1.json
  def destroy
    @chalie_vice_letter.destroy
    respond_to do |format|
      format.html { redirect_to chalie_vice_letters_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chalie_vice_letter
      @chalie_vice_letter = ChalieVice::Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chalie_vice_letter_params
      params.fetch(:chalie_vice_letter, {})
    end
end
