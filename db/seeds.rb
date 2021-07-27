# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Users data creation
User.create!(email: 'example1@mail.com' , password: 'password' , password_confirmation: 'password')
User.create!(email: 'example2@mail.com' , password: 'password' , password_confirmation: 'password')
User.create!(email: 'example3@mail.com' , password: 'password' , password_confirmation: 'password')

#Employees data creation
Employee.create!(name: 'emp1', emp_id: '1234', password: 'AXSP', designation: 'manager', qualificaton: 'BE', from_date: '2021-07-21', end_date: '2021-08-22', is_super_admin: true)
Employee.create!(name: 'emp2', emp_id: '12345', password: 'XYZ', designation: 'engineer', qualificaton: 'BE', from_date: '2021-07-21', end_date: '2021-08-22', is_super_admin: false)
Employee.create!(name: 'emp3', emp_id: '123456', password: 'XYZX', designation: 'admin', qualificaton: 'MCA', from_date: '2021-07-21', end_date: '2021-08-22', is_super_admin: true)



