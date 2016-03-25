class SequencesController < ApplicationController
  def create
    result = DetermineSequence.call(content: params[:sequence])

    if result.success?
      render json: {content: result.jobs}
    else
      render json: {error: result.error}, status: :unprocessable_entity
    end
  end
end
