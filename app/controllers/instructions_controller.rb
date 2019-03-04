class InstructionsController < ApplicationController
  before_action :find_step

  def index
    @instructions = Instruction.where(step: @step)
  end

  def show
    find_instruction
  end

  private

  def find_step
    @step = Step.find(params[:step_id])
  end

  def find_instruction
    @instruction = Instruction.find(params[:id])
  end
end
