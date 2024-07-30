module ApplicationHelper
  def inline_svg(filename, options = {})
    file_path = Rails.root.join('app', 'assets', 'images', filename)
    if File.exist?(file_path)
      file = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css('svg')
      options.each { |attr, value| svg[attr.to_s] = value }
      doc.to_html.html_safe
    else
      '(SVG not found)'
    end
  end
end
