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
        pdf.table(table_rows, :column_widths => [120,420]) do
          style column(0), :background_color => 'A7A7A7'
        end
      end

      pdf.move_down 22
      pdf.text "Summary of Services Requested", :style => :bold
      pdf.move_down 8
      pdf.text "This is where the narrative field will appear. 
      Sample: Melanoma Research Manager, Sarah Hunt, requested the Clinical Trials Office (CTO) to provide consultation and guidance with the close-out visit process for one of the sites participating in the Multi-Center Trial, Protocol #06-056."


      pdf.move_down 22
      pdf.text "Summary of Service Activities", :style => :bold
      pdf.move_down 8
      pdf.text "This will be a listing of dates and descriptions of what was done on that date."


      pdf.move_down 22
      pdf.text "Recommended Follow-up", :style => :bold
      pdf.move_down 8
      pdf.text "Recommended follow-ups will appear here (free text)."
      

      pdf.move_down 50
      pdf.text "Report prepared by:                                                              Date:", :style => :bold
      pdf.move_down 14
      pdf.text "___________________________________                           ______________"
      pdf.font_size 9
      pdf.move_down 2
      pdf.text "Name of person logged in."
      pdf.move_down 2
      pdf.text "Title of person logged in"
      pdf.move_down 2
      pdf.text "Clinical Trial Office"
      pdf.move_down 2
      pdf.text "Dana-Farber Cancer Institute"


      pdf.font_size 12
      pdf.move_down 30
      pdf.text "Report approved by:                                                              Date:", :style => :bold
      pdf.move_down 14
      pdf.text "___________________________________                           ______________"
      pdf.font_size 9
      pdf.move_down 2
      pdf.text "Print name: "
    end
  end

  def table_rows
    [["Disease Group", "Melanoma Research Group"], ["Research Manager", "Sarah Hunt"], ["Date of Initial Request", "4/5/11"], ["Date Request Completed", "4/10/11"], ["CTO Staff Assigned", "Anne Daoust"], ["Description", "DFCI Multi-Center Trial 06-056 / Site 'Close-Out' process"]]
  end
end

Report.new.generate_pdf
`open tmp/consult_report.pdf`
