# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SchoolInfo.create(name: 'Dnyandeep Classes', address: 'Dindori')
# User.create(email: 'abhichede777@gmail.com', password: 'Abhichede777@', roles_mask: 1, approved: true, confirmed_at: Time.now)
# MyTemplate.create(name: 'Fee Receipt', desc: '
# <p style="text-align: center; line-height: 1;">
# <span style="font-size: 18px;">
# Receipt No. #{receipt_no}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>
# <span style="font-size: 18px;">
# #{institute_logo}</span>
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
# <span style="font-size: 18px;">
# Date: #{date}&nbsp;</span>
# <span style="font-size: 18px;">
# <br></span>
# </p>
# <p style="line-height: 1;">
# <span style="font-size: 12px;">
#
# </span>
# <span style="font-size: 12px;">
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
#  &nbsp; &nbsp; &nbsp; &nbsp;
# </span></p>
# <p style="line-height: 1;">
# <span style="font-size: 12px;">
# #{institute_registration_no}</span>
# <span style="font-size: 12px;">
# &nbsp; &nbsp;</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp;&nbsp;</p>
# <p style="line-height: 1;"><b>
# <span style="font-size: 24px;">
# <u>
# #{institute_name}
# </u>
# </span></b></p>
# <p style="line-height: 1;">
# #{institute_address}</p>
# <p style="line-height: 1;">
# <span style="font-size: 18px;">
# <span style="font-size: 14px;">
# #{institute_contact}&nbsp;</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp;</span></p><hr>
# <p style="text-align: center; line-height: 1;">
# Recieved with thanks from&nbsp;&nbsp;<b>#{student_name}&nbsp; &nbsp;</b>
# Standard:&nbsp;<b>#{student_standard}&nbsp;&nbsp;</b>Division:&nbsp;<b>
# #{student_division}</b></p><p style="text-align: center; line-height: 1;">
# The sum of Rs.&nbsp;<b>#{amount_in_words}&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
# </b>By&nbsp; &nbsp; &nbsp;<b>#{payment_mode}&nbsp;</b></p>
# <p style="text-align: center; line-height: 1;">Dated&nbsp; &nbsp;<b>
# #{payment_date}&nbsp; &nbsp; &nbsp;&nbsp;</b>on A/c of&nbsp; &nbsp; &nbsp;&nbsp;<b>
# #{institute_name}</b></p><p style="text-align: center; line-height: 1;"><b><br>
# </b></p><p style="line-height: 1;">&nbsp; &nbsp; &nbsp; &nbsp; Rs.&nbsp;<b>
# #{amount}</b></p><p style="line-height: 1;">&nbsp;<i><span style="font-size: 12px;">
# This receipt is valid subject to realization of&nbsp;</span><span style="font-size: 12px;">
# cheque</span><span style="font-size: 12px;">.</span></i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
# &nbsp; &nbsp; Authorised Signatory</p><hr>
# ')
#
# MyTemplate.create(name: 'Birthday Message', desc: 'It’s our sincere wish that all your hard work and efforts be crowned with success.
# Have a blissful day.')
#
# MyTemplate.create(name: 'Admission Success', desc: 'Congratulations!!!
# #{student_name} has been admitted successfully to #{institute_name}')
#
# MyTemplate.create(name: 'Fee Payment Message', desc: 'Your Fee payment of Rs. #{amount} is successful. Thanks from #{institute_name}')
#
# MyTemplate.create(name: 'Student Absent Message', desc: 'Your child #{student_name} is absent today.')
#
# MyTemplate.create(name: 'Enquiry Success', desc: 'Thank You, #{father_name}, for Visiting #{institute_name}.')
# #

Holiday.create(date: '2018-01-26', description: 'Republic Day')
Holiday.create(date: '2018-02-13', description: 'Maha Shivratri')
Holiday.create(date: '2018-02-19', description: 'Chatrapati Shivaji Maharaj Jayanti')
Holiday.create(date: '2018-03-02', description: 'Holi')
Holiday.create(date: '2018-03-29', description: 'Mahavir Jayanti')
Holiday.create(date: '2018-03-30', description: 'Good Friday')
Holiday.create(date: '2018-04-14', description: 'Dr. Babasaheb Ambedkar Jayanti')
Holiday.create(date: '2018-04-30', description: 'Buddha Purnima')
Holiday.create(date: '2018-05-01', description: 'Maharashtra Day')
Holiday.create(date: '2018-08-15', description: 'Independence Day')
Holiday.create(date: '2018-08-17', description: 'Parsi New Year')
Holiday.create(date: '2018-08-22', description: 'Idul Juha')
Holiday.create(date: '2018-09-13', description: 'Ganesh Chaturthi')
Holiday.create(date: '2018-09-20', description: 'Muharram')
Holiday.create(date: '2018-10-02', description: 'Mahatma Gandhi Jayanti')
Holiday.create(date: '2018-10-18', description: 'Dusshera')
Holiday.create(date: '2018-11-07', description: 'Deewali')
Holiday.create(date: '2018-11-08', description: 'Deepavali')
Holiday.create(date: '2018-11-21', description: 'Id-e-Milad')
Holiday.create(date: '2018-11-23', description: 'Guru Nanak Jayanti')
Holiday.create(date: '2018-12-25', description: 'Christmas Day')