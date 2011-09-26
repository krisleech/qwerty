module DocumentsHelper
  # Convert plain text to HTML by cwaddingAdd <p> tags around paragraphs
  def to_html(text)
    return '' if text.blank?
    text.split("\n").collect { |p| "<p>#{p}</p>"}.join("\n").html_safe
  end

  def document_path(document)
    document.permalink
  end
end
