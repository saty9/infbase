include Rails.application.routes.url_helpers

class UsefulResourceAttachment < ApplicationRecord
  belongs_to :useful_resource
  has_one_attached :document

  def file
    return {
        path: rails_blob_path(self.document, only_path: true),
        name: self.document.filename
    }
  end
end
