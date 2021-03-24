# Helpers for handling prominence in the admin interface
module Admin::ProminenceHelper
  ICON = {
    normal: 'icon-eye-open',
    backpage: 'icon-eye-close',
    requester_only: 'icon-eye-close icon-warning-bg',
    hidden: 'icon-eye-close icon-error-bg'
  }.with_indifferent_access.freeze

  def prominence_icon(prominenceable)
    prominence = prominenceable.try(:prominence) || prominenceable
    tag.i class: "#{ ICON[prominence] }", title: prominence
  end
end
