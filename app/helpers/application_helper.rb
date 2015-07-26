module ApplicationHelper
  def shortifed(url)
    url.short_urls.first
  end
  
  def title_and_description(url)
    "<p><b>#{truncate(url.title, length: 10, escape: false)}</b> #{truncate(url.description, length: 50)}<br></p>".html_safe
    if url.title.nil? || url.description.nil?
      '<p class="empty">&nbsp;</p> <p class="empty">&nbsp;</p>'.html_safe
    else
      "<p><b>#{truncate(url.title, length: 10, escape: false)}</b> #{truncate(url.description, length: 50)}</p><br/>".html_safe
    end
  end
end
