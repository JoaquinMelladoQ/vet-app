class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = History.all
  end

  def show
  end

  def new
    @history = History.new
    @pets = Pet.all
  end

  def edit
    @pets = Pet.all
  end

  def create
    @history = History.new(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to @history, notice: 'Pet history was successfully created.' }
        format.json { render :show, status: :created, location: @history }
      else
        format.html { render :new }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'Pet history was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'Pet history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_history
      @history = History.find(params[:id])
    end

    def history_params
      params.require(:history).permit(:weight, :heigth, :description, :pet_id)
    end
end
