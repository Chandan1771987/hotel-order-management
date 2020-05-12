class MenuItem < ApplicationRecord

  has_one_attached :avatar

  def web_json
    {id: id,
     text: name
    }
  end
end
