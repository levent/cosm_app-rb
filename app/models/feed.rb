class Feed < PachubeDataFormats::Feed
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    !id.blank?
  end
end
