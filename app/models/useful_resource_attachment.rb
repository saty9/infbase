# == Schema Information
#
# Table name: useful_resource_attachments
#
#  id                 :bigint           not null, primary key
#  useful_resource_id :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

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
