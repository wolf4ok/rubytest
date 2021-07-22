module ApplicationHelper

  def url_to_images(str)
    str.gsub!(%r{https://[^\s<]+}) do |url|
      "<img src='#{url}' width='100'; />"
    end
    str.html_safe
  end

  def url_to_links(str)
    str.gsub!(%r{https://[^\s<]+}) do |url|
      "<a href='#{url}' target='_blank'>link to content</a>"
    end
    str.html_safe
  end

end
