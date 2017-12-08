module Tramway
  module Admin
    module ApplicationHelper
      include ::FontAwesome::Rails::IconHelper
      include AuthManagment

      def title(page_title = default_title)
        title_text = "#{page_title} | #{t('application.name')}"
        content_for(:title) { title_text }
      end

      def default_title
        t('.title')
      end
    end
  end
end
