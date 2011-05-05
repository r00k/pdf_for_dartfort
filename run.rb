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


      pdf.move_down 16

      pdf.text "Narrative", :style => :bold

      pdf.move_down 14

      pdf.text "This is where the narrative field will appear. 

      Sample: Melanoma Research Manager, Sarah Hunt, requested the Clinical Trials Office (CTO) to provide consultation and guidance with the close-out visit process for one of the sites participating in the Multi-Center Trial, Protocol #06-056."


      pdf.move_down 16

      pdf.text "Recommendation", :style => :bold

      pdf.move_down 14

      pdf.text "This is where the recommendation field will appear. 
      
      Sample: Schedule close-out visit activities with site -- This site enrolled two participants who are both off study and have completed all related activities. THe site has been closed through their local IRB. The close-out visit activities have been discussed, verified, and all follow up has been reconciled the site can then be close through the DFCI IRB."


      pdf.move_down 16

      pdf.text "Follow-up", :style => :bold

      pdf.move_down 14

      pdf.text "This is where the follow-up field will appear. 

      (More text here, relating to follow-up.)"
      

      pdf.move_down 50

      pdf.text "Report prepared by:                                                              Date:", :style => :bold

      pdf.move_down 14

      pdf.text "___________________________________                           ______________"






    end
  end

  def table_rows
    [["Disease Group", "Melanoma Research Group"], ["Research Manager", "Sarah Hunt"], ["Meeting Dates", "4/5/11"], ["CTO Representatives", "Anne Daoust"], ["Subject", "DFCI Multi-Center Trial 06-056 / Site 'Close-Out' process"]]
  end
end

Report.new.generate_pdf
`open tmp/consult_report.pdf`
