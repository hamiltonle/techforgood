# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Enrollment.destroy_all
Lesson.destroy_all
Session.destroy_all
User.destroy_all
Course.destroy_all
Organization.destroy_all

puts "creating fake students and courses"


# Students Seeds
puts "creating students"

student1 = User.new(
  first_name: 'Amin',
  last_name: 'Malik',
  group: 'Le Wagon',
  email: "amin@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood'
  )
puts "saved a student user"
student1.save!

student2 = User.new(
  first_name: 'Kiki',
  last_name: 'Judd',
  group: 'All Blacks',
  email: "kiki@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood'
  )
puts "saved a student user"
student2.save!

student3 = User.new(
  first_name: 'Hamilton',
  last_name: 'Le',
  group: 'Johnson & Johnson',
  email: "hamilton@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood'
  )
puts "saved a student user"
student3.save!


# Organization seeds
puts "creating organizations"

org = Organization.new(
  name: "Hands On",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi nam esse odit consequuntur officiis nesciunt eius deleniti sunt pariatur, molestiae obcaecati minima rem excepturi nulla ea, praesentium aspernatur voluptas, harum?"
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "Microsoft",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem aliquid voluptatum eum quam natus perferendis possimus nam voluptate, ducimus obcaecati alias fuga ab, omnis. Eaque pariatur accusamus quibusdam assumenda laudantium."
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "Johnson & Johnson",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum saepe, quisquam deleniti maxime unde, harum consequuntur cupiditate nobis quos ut, itaque est quas labore atque dolorem animi, voluptatibus expedita! Dicta?"
  )
org.save!
puts "saved an org"


# Course seeds
puts "creating courses"

course = Course.new(
  title: "3D Printing",
  description: "3D printed prosthetics for children in need"
  )
course.organization = Organization.find(1)
course.save!
puts "saved a course"


course = Course.new(
  title: "Computer Vision",
  description: "Using Microsoft's computer vision technology to find missing children"
  )
course.organization = Organization.find(2)
course.save!
puts "saved a course"


course = Course.new(
  title: "Augmented Reality",
  description: "Augmented Reality for vision-impaired people"
  )
course.organization = Organization.find(3)
course.save!
puts "saved a course"


# Enrollment seeds
puts "creating enrollments"

enrollment = Enrollment.new
enrollment.course = Course.find(1)
enrollment.user = User.find(1)
enrollment.save!
puts "saved an enrollment"

enrollment = Enrollment.new
enrollment.course = Course.find(2)
enrollment.user = User.find(1)
enrollment.save!
puts "saved an enrollment"

enrollment = Enrollment.new
enrollment.course = Course.find(1)
enrollment.user = User.find(2)
enrollment.save!
puts "saved an enrollment"

enrollment = Enrollment.new
enrollment.course = Course.find(3)
enrollment.user = User.find(2)
enrollment.save!
puts "saved an enrollment"

enrollment = Enrollment.new
enrollment.course = Course.find(2)
enrollment.user = User.find(3)
enrollment.save!
puts "saved an enrollment"

enrollment = Enrollment.new
enrollment.course = Course.find(3)
enrollment.user = User.find(3)
enrollment.save!
puts "saved an enrollment"

# Lessons seeds
puts "Creating lessons"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How 3D printers work"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How 3D printers work"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How Computer Vision Works"
  )
lesson.course = Course.find(2)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How Computer Vision Works"
  )
lesson.course = Course.find(2)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How AR work"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  video: "http://player.youku.com/embed/XMTY3NjE3ODIyOA==",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.

Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  title: "How AR work"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"


# Session seeds
puts "Creating sessions"

session = Session.new
session.lesson = Lesson.find(1)
session.user = User.find(1)
session.status = "complete"
session.save!
puts "saved a lesson"

session = Session.new
session.lesson = Lesson.find(2)
session.user = User.find(1)
session.status = "started"
session.save!
puts "saved a lesson"

session = Session.new
session.lesson = Lesson.find(3)
session.user = User.find(2)
session.status = "complete"
session.save!
puts "saved a lesson"

session = Session.new
session.lesson = Lesson.find(4)
session.user = User.find(2)
session.status = "started"
session.save!
puts "saved a lesson"

session = Session.new
session.lesson = Lesson.find(5)
session.user = User.find(3)
session.status = "started"
session.save!
puts "saved a lesson"
