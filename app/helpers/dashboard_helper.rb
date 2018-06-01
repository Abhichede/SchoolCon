module DashboardHelper


  def high_chart

    # today = Date.today
    # week_end = today.at_end_of_week
    #
    # @subwise = []
    #
    # Subject.all.each do |sub|
    #   data = Hash.new
    #   week_s = today.at_beginning_of_week
    #   while week_s != week_end
    #   counter = 0
    #   @current = sub.attendances.where(date: week_s.strftime('%d-%m-%Y'))
    #   @current.each do |att|
    #     Student.all.each do |stud|
    #       if att.att_data["#{stud.id}"] === 'on'
    #         counter += 1
    #       end
    #     end
    #   end
    #     data[week_s.strftime('%Y-%m-%d')] = counter
    #
    #     week_s += 1
    #   end
    #
    #   @subwise.push({name: sub.name, data: data})
    # end
    #
    # @subwise
    #

    @division_wise = []
    Standard.all.each do |standard|
      data = Hash.new
      standard.divisions.each do |division|
        counter = 0
        division.attendances.where(date: Date.today.strftime('%d-%m-%Y')).each do |attendance|
          unless attendance.att_data.nil?
            division.students.all.each do |stud|
              counter += 1 if attendance.att_data["#{stud.id}"] === 'on'
            end
          end
        end

        data["Section - #{division.name}"] = counter
      end
      @division_wise.push({name: "STD - #{standard.name}", data: data})
    end
    puts @division_wise
    @division_wise
  end

  def high_chart_fee
    @data = Hash.new

    StudentFeePayment.select('payment_date, SUM(amount) as amount').group(:payment_date).each do |fee|
      @data.store(fee.payment_date, fee.amount)
    end

    @data
  end

  def birthday_today_students
    @students_birth = []
    today = Date.today
    @students.each do |stud|
      dob = stud.date_of_birth.to_date
      if dob.day == today.day && dob.month == today.month
        @students_birth.push(stud)
      end
    end
    @students_birth
  end


  # def goog_chart
  #   subject_a = ['Date']
  #
  #   Subject.all.each do |sub|
  #     subject_a.push(sub.name)
  #   end
  #
  #   today = Date.today
  #   week_end = today.at_end_of_week
  #   week_s = today.at_beginning_of_week
  #   @attendance_data = [subject_a]
  #
  #   while week_s != week_end
  #     @subwise = [week_s.to_s]
  #
  #     Subject.all.each do |sub|
  #       counter = 0
  #       @current = sub.attendances.where(date: week_s.strftime('%d-%m-%Y'))
  #       @current.each do |att|
  #         Student.all.each do |stud|
  #           if att.att_data["#{stud.id}"] === 'on'
  #             counter += 1
  #           end
  #         end
  #       end
  #       @subwise.push(counter)
  #     end
  #     @attendance_data.push(@subwise)
  #
  #     week_s += 1
  #   end
  #
  #   @attendance_data
  # end
end
