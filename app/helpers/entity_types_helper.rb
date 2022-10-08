module EntityTypesHelper
  def available_entity_types
    types = EntityType.all.pluck(:text, :id)
    types << ["-- Create New --", ""]
  end
end
