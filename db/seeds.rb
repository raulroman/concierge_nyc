# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Building.create(name:"The Future Condo", resident_manager:1)
# Building.create(name:"Lawrence Towers", resident_manager:2)
# Shift.create(full_time_employee_id:1, day_of_the_week:"Monday", date:"1/10/18", start_time:"7am", end_time:"3pm", position:"Concierge", building_id:1, approved_denied:true, private_listing:false, public_listing:true,  claimed_by_employee_id:15, relief_type:"relief employee")
# Shift.create(full_time_employee_id:1, day_of_the_week:"Monday", date:"1/29/18", start_time:"7am", end_time:"3pm", position:"Concierge", building_id:2, approved_denied:nil)
Shift.create!(day_of_the_week:"Thursday", date:"2/8/18", start_time:"9am", end_time:"5pm", position:"Porter", building_id: 2)
Shift.create!(day_of_the_week:"Friday", date:"2/9/18", start_time:"7am", end_time:"3pm", position:"Handyman", building_id: 3)
Shift.create!(day_of_the_week:"Monday", date:"2/10/18", start_time:"8am", end_time:"4pm", position:"Concierge", building_id: 1)
Shift.create!(day_of_the_week:"Tuesday", date:"2/11/18", start_time:"10am", end_time:"6pm", position:"Porter", building_id: 3)
Shift.create!(day_of_the_week:"Wednesday", date:"2/12/18", start_time:"3pm", end_time:"11pm", position:"Handyman", building_id: 1)
Shift.create!(day_of_the_week:"Thursday", date:"2/13/18", start_time:"11pm", end_time:"7am", position:"Handyman", building_id: 2)


