module Guts
  # Type model
  class Type < ApplicationRecord
    extend FriendlyId
    include NavigatableConcern
    include MultisiteScopeConcern

    validates :title, presence: true, length: { minimum: 3 }

    has_many :contents
    has_many :media, as: :filable, dependent: :destroy
    has_many :metafields, as: :fieldable, dependent: :destroy

    friendly_id :title, use: %i[slugged scoped finders], scope: :site_id
    navigatable :title, format: ':title'

    # Updates slug if title changes
    # @return [Boolean]
    def should_generate_new_friendly_id?
      title_changed?
    end
  end
end
