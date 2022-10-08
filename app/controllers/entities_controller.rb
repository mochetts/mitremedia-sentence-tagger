class EntitiesController < ApplicationController

  def create
    entity = Entity.new(entity_params)

    respond_to do |format|
      if entity.save
        format.html { redirect_to sentence_url(entity.sentence), notice: "Entity was successfully created" }
      else
        format.html { redirect_to sentence_url(entity.sentence), flash: { error: "There was a problem creating your entity" } }
      end
    end
  end

  private

  def entity_params
    accepted_params = params.require(:entity).permit(
      :word_start_index,
      :word_end_index,
      :sentence_id,
      :entity_type_id,
      entity_type_attributes: [:text, :color]
    )
    accepted_params.delete(:entity_type_id) if accepted_params[:entity_type_id].blank?
    accepted_params
  end
end
