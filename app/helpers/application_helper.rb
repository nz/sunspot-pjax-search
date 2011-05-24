module ApplicationHelper
  
  def highlighted_lines(paragraph, highlight)
    paragraph.lines.collect do |line|
      highlight(line, highlight) + '<br>'.html_safe
    end.join.html_safe
  end
  
end
