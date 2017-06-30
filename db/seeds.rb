# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting all current data"

# Enrollment.destroy_all
# Lesson.destroy_all
# Session.destroy_all
# User.destroy_all
# Course.destroy_all
# Organization.destroy_all

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
  tagline: "Learn how to make 3d printed prosthetics for children in need",
  issue: "Prosthetics can involve a lot of work and expertise to produce and fit and the WHO says there is currently a shortage of 40,000 trained prosthetists in poorer countries. There is also the time and financial cost to patients, who may have to travel long distances to assess their need, produce a prosthesis and fit it to the residual limb. The result is that braces and artificial limbs are among the most desperately needed medical devices.",
  tech_solution: "Slowly but surely, 3D printing, also known as additive manufacturing, has made it easier to build low cost customized prosthetics. Perhaps this is not surprising, given that its key benefit is to enable the rapid and cost-efficient creation of bespoke products. There are few commercial products that need to suit a wider variety of shapes and sizes than medical devices made for human beings",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from the Illinois MakerLab (the world's first 3D printing lab in a Business School) along with industry experts from both Autodesk (a leading 3D software firm) and Ultimaker (a leading 3D hardware firm).

You will obtain a rich understanding of what 3D printing is, how 3D printers work, and how this new technology is being used by both individuals and firms to revolutionize our world. In addition, you will acquire a set of skills that will enable you to create digital designs that you can transform into physical objects. These skills can be used to help you launch a career in the growing field of 3D printing, be the 3D printing expert in your current firm, or just make the things you need.

",


  )
course.organization = Organization.find(3)
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
course.organization = Organization.find(1)
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
  title: "Crippling injustice",
  text: "f you judged the country by its laws alone, China would be a global leader on disability rights. The ‘Laws on the Protection of Persons with Disabilities’, introduced in 1990, offer strong and wide-ranging protection of the civil rights of the disabled, guaranteeing employment, education, welfare, and access. But despite the high concerns of the law, Chinese cities make little concession to disabled people. As the sociologist Yu Jianrong has documented, raised pathways for the blind often lead into dead ends, bollards, trees or open pits, or else spiral decoratively but misleadingly. Wheelchair access is non-existent, especially outside Beijing or Shanghai, and guide dogs are effectively forbidden from most public spaces, despite the authorities’ repeated promises of full access.",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 15,
  module_name: "why"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "Zhanyijihua's Solution",
  text: "Through the design, the production of economical simple 3D printing machinery prosthetics, and open source and dissemination of this technology, the wing plan hopes to help millions of children with physical disability in China.",
  lesson_type: "quiz",
  video: "",
  minutes: 10,
  module_name: "why"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"



lesson = Lesson.new(
  title: "Enabling The Future",
  text: "
Learn a little about the grassroots, open-source e-NABLE Community and our history!

aboutusfinal



Thank you for visiting our website enablingthefuture.org !

The place for information, stories and reference material about e-Nable, worldwide!

If you would like to learn more about the history of the field of 3D printable, open source prosthetics, please read below!



The e-NABLE Community is an amazing group of individuals from all over the world who are using their 3D printers to create free 3D printed hands and arms for those in need of an upper limb assistive device.

They are people who have put aside their political, religious, cultural and personal differences – to come together and collaborate on ways to help improve the open source 3D printable designs for hands and arms for those who were born missing fingers or who have lost them due to war, disease or natural disaster.

The e-NABLE Community is made up of  teachers, students, engineers, scientists, medical professionals, tinkerers, designers, parents, children, scout troops, artists, philanthropists, dreamers, coders, makers and every day people who just want to make a difference and help to “Give The World A Helping Hand.”",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNTYzODA4Mzk2/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 15,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "Our Story",
  text: "
Learn a little about the grassroots, open-source e-NABLE Community and our history!

aboutusfinal



Thank you for visiting our website enablingthefuture.org !

The place for information, stories and reference material about e-Nable, worldwide!

If you would like to learn more about the history of the field of 3D printable, open source prosthetics, please read below!



The e-NABLE Community is an amazing group of individuals from all over the world who are using their 3D printers to create free 3D printed hands and arms for those in need of an upper limb assistive device.

They are people who have put aside their political, religious, cultural and personal differences – to come together and collaborate on ways to help improve the open source 3D printable designs for hands and arms for those who were born missing fingers or who have lost them due to war, disease or natural disaster.

The e-NABLE Community is made up of  teachers, students, engineers, scientists, medical professionals, tinkerers, designers, parents, children, scout troops, artists, philanthropists, dreamers, coders, makers and every day people who just want to make a difference and help to “Give The World A Helping Hand.”

For more on the history and continuing story of the e-NABLE Community – please see below!



Giving The World A “Helping Hand” from Jen Martin Studios on Vimeo.





In 2011, my husband Ivan Owen, created a crazy metal functional puppet hand to wear to our first ever steampunk convention. When we returned home from our adventure, he decided to post a short video of it on Youtube. Little did we know that one simple video clip would change our lives and thousands of others – forever.

A simple Youtube video of the hand, led to an email from a carpenter named Richard from South Africa,who had lost his fingers in a woodworking accident and a collaboration across 10,000 miles to create a replacement finger for him that lasted nearly a year. They worked through various protolesson_types and designs via skype and email, using objects they could both find around their homes and respective countries.

This ultimately led to a mother of a 5 year old boy contacting them to see about the creation of a tiny version of this hand for a little boy named Liam who lives in South Africa who was born with no fingers on his right hand.",
  lesson_type: "article",
  video: "",
  minutes: 10,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"




lesson = Lesson.new(
  title: "The 3D Printing Revolution",
  text: "This course will demonstrate how 3D printers work, show what people make with them, and examine the 3D printing ecosystem. It will also explore the future of 3D printing and discuss how this technology will revolutionize our world. The course materials include informative video lectures, on-location interviews with a variety of 3D printing experts, and engaging hands-on exercises. Learners who complete this introductory course will have a solid understanding of 3D printing and its revolutionary potential, and will be able to print and customize 3D designs. In addition, learners will obtain a preview of the other courses in the 3D Printing Specialization and gain an appreciation for how these courses will help them develop the knowledge and skills to turn their ideas into objects.

This course was listed in the top 50 MOOC's of all time by Class-Central (https://www.class-central.com/report/top-moocs/)",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNjMxMTExMTQ0/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 20,
  module_name: "what"

  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Applications",
  text: "This course will help you understand how 3D printing is being applied across a number of domains, including design, manufacturing, and retailing. It will also demonstrate the special capabilities of 3D printing such as customization, self-assembly, and the ability to print complex objects. In addition to business applications, this course will also examine how individuals, including those in developing countries, are using this technology to create solutions to the problems they face. This course will also provide an overview of design thinking and how you can use this framework to develop ideas that can be turned into objects. Learners who complete this course will obtain a rich understanding of the capabilities of 3D printing and how to think about designing objects for this new technology.",
  lesson_type: "article",
  video: "",
  minutes: 10,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How 3D printers work",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  lesson_type: "quiz",
  video: "",
  minutes: 30,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Software",
  text: "This course will demonstrate how to use 3D printing software to create digital designs that can be turned into physical objects. It will also demonstrate how 3D scanners work to turn physical objects into digital designs. This course is hands-on in nature and will provide step-by-step instructions to guide you through two popular 3D modeling programs, Tinkercad and Fusion 360. Learners who complete this course will be able to use 3D software to design a wide variety of objects for both personal and professional use. In addition, learners who enroll in the course certificate will receive extended free access to Fusion 360 (provided by Autodesk).
",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNTAyOTcwMzgw/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 10,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Hardware",
  text: "This course will provide an in-depth exploration of desktop 3D printing hardware. It will examine the history of desktop 3D printing and demonstrate how 3D printers are made and how they work. This course will also provide step-by-step instructions for how to use and repair a 3D printer. It will also explore the different lesson_types of materials that can be 3D printed and will demonstrate how you can create various objects using these tools and materials. Learners who complete this course will be able to successfully operate, repair, and upgrade a 3D printer. In addition, learners who enroll in the course certificate will be able to purchase a desktop 3D printer at a discounted price (provided by Ultimaker).

If you enjoy this business course and are interested in an MBA, consider applying to the iMBA, a flexible, fully-accredited online MBA at an incredibly competitive price offered by the University of Illinois. For more information, please see the Resource page in this course and onlinemba.illinois.edu.",
  lesson_type: "assignment",
  video: "",
  minutes: 30,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Capstone",
  text: "The capstone will integrate the learning acquired from the four courses in the 3D Printing Specialization through a hands-on project. This project will enable you to turn an idea into an object using the knowledge and skills acquired through the other courses. Specifically, you will be guided through a step-by-step process in which you imagine, design, make, and share a 3D printed object. Thus, through this capstone, you will be able to put course concepts into action and utilize the skills that you have acquired throughout the Specialization. In addition, you will be able to obtain an actual 3D print of the object you design at a discounted price through our corporate partners, 3D Hubs and Shapeways.",
  lesson_type: "discussion",
  video: "",
  minutes: 15,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"




lesson = Lesson.new(
  title: "How Computer Vision Works",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(2)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How Computer Vision Works",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "how"
  )
lesson.course = Course.find(2)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How AR work",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How AR work",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Cras mattis consectetur purus sit amet fermentum.",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='480' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"


# # Session seeds
# puts "Creating sessions"

# session = Session.new
# session.lesson = Lesson.find(1)
# session.user = User.find(1)
# session.status = "completed"
# session.save!
# puts "saved a lesson"

# session = Session.new
# session.lesson = Lesson.find(2)
# session.user = User.find(1)
# session.status = "started"
# session.save!
# puts "saved a lesson"

# session = Session.new
# session.lesson = Lesson.find(3)
# session.user = User.find(2)
# session.status = "completed"
# session.save!
# puts "saved a lesson"

# session = Session.new
# session.lesson = Lesson.find(4)
# session.user = User.find(2)
# session.status = "started"
# session.save!
# puts "saved a lesson"

# session = Session.new
# session.lesson = Lesson.find(5)
# session.user = User.find(3)
# session.status = "started"
# session.save!
# puts "saved a lesson"
