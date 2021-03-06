class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.to_markdown(string)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, fenced_code_blocks: true)
    if string.nil?
      return ""
    else
      markdown.render(string).html_safe
    end
  end
end
