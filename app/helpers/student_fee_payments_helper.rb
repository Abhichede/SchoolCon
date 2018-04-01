module StudentFeePaymentsHelper

  def fill_receipt
    @receipt_template.desc.gsub! '#{institute_logo}', image_tag(current_institute.logo, height: 100, width: 100)
    @receipt_template.desc.gsub! '#{institute_name}', current_institute.name
    @receipt_template.desc.gsub! '#{institute_address}', current_institute.address
    @receipt_template.desc.gsub! '#{institute_contact}', current_institute.contact
    @receipt_template.desc.gsub! '#{institute_gst_no}', current_institute.gst_no
    @receipt_template.desc.gsub! '#{institute_registration_no}', current_institute.registration_no
    @receipt_template.desc.gsub! '#{student_name}', @student.self_full_name
    @receipt_template.desc.gsub! '#{student_contact}', @student.student_mobile
    @receipt_template.desc.gsub! '#{student_standard}', @student.standards.last.name
    @receipt_template.desc.gsub! '#{student_division}', @student.divisions.last.name
    @receipt_template.desc.gsub! '#{amount}', @student.student_fee_payments.last.amount.to_s
    @receipt_template.desc.gsub! '#{balance_amount}', @student.current_balance_amount.to_s

    @receipt_template.desc.gsub! '#{receipt_no}', @student_fee_payment.id.to_s
    @receipt_template.desc.gsub! '#{receipt_date}', Date.today.to_s

    @receipt_template.desc.gsub! '#{fee_details}', fee_details_str
    @receipt_template.desc.gsub! '#{fee_summary}', fee_summary_str
  end

  def fee_details_str
    fee_details = ""+
        "<table class='table table-bordered table-responsive'>"+
          "<thead>"+
            "<tr>
              <th>Date</th>
              <th>Amount</th>
              <th>Mode</th>
              <th>Desc</th>
            </tr>"+
          "</thead>"+
          "<tbody>
            <tr>
              <td>#{@student_fee_payment.payment_date}</td>
              <td>#{@student_fee_payment.amount}</td>
              <td>#{@student_fee_payment.payment_mode}</td>
              <td>#{@student_fee_payment.payment_desc}</td>
            </tr>
          </tbody>"+
        "</table>"
  end

  def fee_summary_str
    fee_summary = ""+
        "<div class='row'><div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'></div>
          <div class='col-lg-6 col-md-6 col-sm-6 col-xs-6'>"+
        "<table class='table table-bordered table-responsive'>"+
          "<tbody>"+
            "<tr>
              <th>Allocated</th>
              <td>#{@student.current_total_fee}</td>
             </tr>
              <tr>
              <th>Instant</th>
              <td>#{@student.current_total_instant_fee}</td>
             </tr>
             <tr>
              <th>Fine</th>
              <td>#{@student.current_total_fine}</td>
             </tr>
             <tr>
              <th>Discount</th>
              <td>#{@student.current_total_discount}</td>
             </tr>
             <tr>
              <th>Paid</th>
              <td>#{@student.current_total_paid}</td>
             </tr>
             <tr>
              <th>Balance</th>
              <td>#{@student.current_balance_amount}</td>
             </tr>"+
          "</tbody>"+
        "</table>"+
        "</div></div>"
  end
end
