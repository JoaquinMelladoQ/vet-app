class HistoriesController < ApplicationController
  before_action :set_history, only: %i[ show edit update destroy ]
  before_action :set_pet 

  def index
    @histories = @pet.histories
  end

  def show
  end

  def new
    @history = @pet.histories.build
  end

  def edit
  end

  def create
    @history = @pet.histories.build(history_params)

    respond_to do |format|
      if @history.save
        format.html { redirect_to [@pet, @history], notice: "History was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @history.update(history_params.merge(pet: @pet))
        format.html { redirect_to [@pet, @history], notice: "History was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to [@pet, @history], notice: "History was successfully destroyed." }
    end
  end

  private
    def set_history
      @history = History.find(params[:id])
    end

    def set_pet
      @pet = Pet.find(params[:pet_id])
    end

    def history_params
      params.require(:history).permit(:date, :weight, :height, :description)
    end
end
