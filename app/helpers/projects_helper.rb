module ProjectsHelper
  def score_fields f, title, field1, field2
    html = ""
    html = "<p><strong>#{title}:</strong>"
    html += "#{f.text_field field1, :size => 3}" + "<br/>"
    html += "<strong>Comentario:</strong><br/>"
    html += f.text_area field2, :rows => 5, :cols => 90
    html += "</p>"
    html.html_safe
  end
end
