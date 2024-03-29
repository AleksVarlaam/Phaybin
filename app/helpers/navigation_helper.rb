# frozen_string_literal: true

module NavigationHelper
  def nav_tab(title, url, options = {})
    current_page = options.delete :current_page

    css_class = current_page == title ? 'text-gray-300 dark:text-white' : 'text-gray-100 dark:text-gray-400'

    options[:class] = if options[:class]
                        "#{options[:class]} #{css_class}"
                      else
                        css_class
                      end

    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/navigations/header', locals: { current_page: }
    render partial: 'shared/navigations/footer', locals: { current_page: }
  end

  def full_title(page_title = '')
    base_title = 'Phaybin'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
