class IdeasSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :date

  def date
    Date.parse(object.created_at.to_s)
  end
end
