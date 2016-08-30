class ReportPdf < Prawn::Document
  def initialize(results)
    super()
    @results = results
    header
    text_content
    table_content
  end

  def header
    image "#{Rails.root}/app/assets/images/Real_eState_logo.png", width: 248, height: 47
  end

  def text_content
    y_position = cursor - 20
    bounding_box([0, y_position], :width => 270, :height => 30) do
      text "Report Results", size: 15, style: :bold
    end
  end

  def table_content
    table result_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
    end
  end

  def result_rows
    @result_rows ||= [@results.columns] + @results.values
  end
end
