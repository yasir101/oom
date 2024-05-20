require 'caxlsx'
require 'date'
require 'active_support'
require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/integer/time'
require_relative '../../config/environment'  # Load the Rails environment

class SpendingLogsReport
  def self.generate
    current_year = Date.today.year
    current_month = Date.today.month
    data_by_month = fetch_data_by_month(current_year, current_month)
    file_path = "spending_logs_report_#{current_year}.xlsx"
    generate_excel_file(data_by_month, file_path, current_month)
    file_path
  end

  private

  def self.fetch_data_by_month(year, current_month)
    data_by_month = {}
    (1..current_month).each do |month|
      start_date = Date.new(year, month, 1)
      end_date = start_date.end_of_month
      spending_logs = SpendingLog.where(created_at: start_date..end_date)
      data_by_month[month] = spending_logs
    end
    data_by_month
  end

  def self.generate_excel_file(data_by_month, file_path, current_month)
    p = Axlsx::Package.new
    wb = p.workbook

    header_style = wb.styles.add_style(b: true, bg_color: '00FF00', fg_color: '000000')
    total_style = wb.styles.add_style(b: true, bg_color: 'FFFF00', fg_color: '000000')
    report_style = wb.styles.add_style(b: true, fg_color: '000000')

    # Create the "Report" sheet
    report_totals = []
    wb.add_worksheet(name: "Report") do |sheet|
      sheet.add_row ["Month", "Total Amount"], style: header_style
      data_by_month.each do |month, spending_logs|
        month_name = Date::MONTHNAMES[month]
        total_amount = spending_logs.sum { |log| log.amount.to_f }
        report_totals << total_amount
        sheet.add_row [month_name, total_amount], style: report_style
      end
      # Add a row for the total of all months
      grand_total = report_totals.sum
      sheet.add_row ["Total", grand_total], style: total_style
    end

    # Create individual month sheets
    data_by_month.each do |month, spending_logs|
      next if month > current_month  # Skip upcoming months

      month_name = Date::MONTHNAMES[month]  # Get the full month name
      wb.add_worksheet(name: month_name) do |sheet|
        total_amount = spending_logs.sum { |log| log.amount.to_f }  # Calculate the total amount
        sheet.add_row ["Total Amount", total_amount], style: total_style  # Add total amount row
        sheet.add_row []  # Add a blank row
        sheet.add_row ["Spending Type", "Action", "Amount", "Quantity", "Description", "Created At"], style: header_style  # Add header row
        spending_logs.each do |log|
          sheet.add_row [log.spending_type, log.action, log.amount, log.quantity, log.description, log.created_at]
        end
      end
    end

    p.serialize(file_path)
  end
end

if __FILE__ == $PROGRAM_NAME
  file_path = SpendingLogsReport.generate
  puts "Report generated: #{file_path}"
end
