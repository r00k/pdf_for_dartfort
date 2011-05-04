require 'rubygems'
require 'bundler/setup'
require 'prawn'

class Report

  OUTPUT_FILE_NAME = "tmp/consult_report.pdf"

  def generate_pdf
    Prawn::Document.generate(OUTPUT_FILE_NAME) do |pdf|
      pdf.font_size 10 do 
        pdf.text "DFCI Clinical Trials Office"
        pdf.text "20 Overland St OS 372"
        pdf.text "Boston MA 02215"
        pdf.move_up pdf.font.height
        pdf.move_up pdf.font.height
        pdf.move_up pdf.font.height
      end

      pdf.font_size 8 do
        pdf.text "44 Binney St", :align => :right
        pdf.text "Boston, MA 02115-6094", :align => :right
        pdf.text "617-632-3000", :align => :right
      end

      pdf.move_down 12

      pdf.text "Regulatory Consultation Report", :align => :center, :font_size => 15, :style => :bold

      pdf.move_down 12

      pdf.font_size 9 do
        pdf.table(table_rows, :column_widths => [100,440]) do
          style column(0), :background_color => 'A7A7A7'
        end
      end

      # pdf.table([["Name and Subject ID Number", "AMOUNT"], table_rows], :header => true, :column_widths => [450, 70]) do
      #   style row(0), :style => :bold, :align => :center
      #   style column(1), :align => :right
      # end
    end
  end

  def table_rows
    [["Disease Group", "Melanoma Research Group"], ["Research Manager", "Sarah Hunt"], ["Meeting Dates", "4/5/11"], ["CTO Representatives", "Anne Daoust"], ["Subject", "DFCI Multi-Center Trial 06-056 / Site 'Close-Out' process"]]
  end
end

Report.new.generate_pdf
`open tmp/consult_report.pdf`
