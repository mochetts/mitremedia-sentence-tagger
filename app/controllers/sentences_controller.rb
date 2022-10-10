class SentencesController < ApplicationController
  def index
    @sentences = Sentence.all.preload_associations_lazily # Prevent N+1s
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)

    respond_to do |format|
      if @sentence.save
        format.html { redirect_to sentences_url, notice: "Sentence was successfully created" }
      else
        format.html { redirect_to sentences_url, flash: { error: "There was a problem creating your sentence: #{@sentence.errors.full_messages.join(', ')}" } }
      end
    end
  end

  def show
    @sentence = Sentence.find(params[:id])
    @new_entity = Entity.new(sentence: @sentence, entity_type: EntityType.new)
  end

  private

  def sentence_params
    params.require(:sentence).permit(:text)
  end
end
