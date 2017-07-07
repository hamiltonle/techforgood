# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "deleting all current data"

Enrollment.destroy_all
Lesson.destroy_all
Session.destroy_all
User.destroy_all
Course.destroy_all
Organization.destroy_all

puts "creating fake students and courses"


# Students Seeds
puts "creating students"

student = User.new(
  first_name: 'Amin',
  last_name: 'Malik',
  group: 'Le Wagon',
  email: "amin@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: "I used to work as an educational content developer creating content (books, music, videos) for an edtech company and wanted to learn the technical skills to build cool products.",
  admin: true
  )
puts "saved a student user"

url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311521/le8ix9nqfdxjwj1fushc.jpg"
student.photo_url = url

student.save!

student = User.new(
  first_name: 'Kiki',
  last_name: 'Judd',
  group: 'LeWagon',
  email: "kiki@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: "I used to work in Sales & Marketing at a company developing software for education. I joined Le Wagon so I could learn to code and bring my own ideas to life.",
  admin: true
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311585/kdpnnvawgqavfwsanjwu.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Hamilton',
  last_name: 'Le',
  group: 'LeWagon',
  email: "hamilton@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: "Involved in education and tech for the past 10 years. Interested to get more technical know-how under my belt and tackle bigger and more interesting challenges ahead!",
  admin: true
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311562/y9tdup08fhevjsadionv.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Ettienne',
  last_name: 'Gagne',
  group: 'LeWagon',
  email: "etienne@gmail.com",
  password: 'techforgood',
  bio: 'I booked a one way to Shanghai with no firm plan after LeWagon',
  password_confirmation: 'techforgood'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311532/xvxveknlnyc11pnenlye.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Jay',
  last_name: 'Gao',
  group: 'LeWagon',
  email: "jay@gmail.com",
  bio: 'Interested in Techs, want to learn about it from scratch, and also got a new job.',
  password: 'techforgood',
  password_confirmation: 'techforgood'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311573/u9wuyy0fgyjct0eco1ka.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Marketa',
  last_name: 'Dragounova',
  group: 'LeWagon',
  email: "marketa@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'I love learning new things and le wagon seemed like the right kind of challenge.'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311596/i8krhgdfhtdaxtvsnirh.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Nathan',
  last_name: 'Lee',
  group: 'LeWagon',
  email: "nathan@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'I hope to either create a start-up or work as a front-end developer focusing on ux and ui.'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1499311606/jom6k1ibvmk8nrk4olbp.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Thibault',
  last_name: 'Genaitay',
  group: 'LeWagon',
  email: "thibault@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'Thibault founded Le Wagon in Shanghai to support creative entrepreneurs build amazing products in China!'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1475007353/yzza4gmf7ktqsnzsun2x.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Forrest',
  last_name: 'Ye',
  group: 'LeWagon',
  email: "forrest@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'At Le Wagon he will teach to our entrepreneurs the fundamentals of code'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1475007397/jzao4su1v6kfzchg22t4.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Maggie',
  last_name: 'Li',
  group: 'LeWagon',
  email: "maggie@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: "I'm a cool gal!  Come talk to me!"
  )
puts "saved a student user"
url = "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_195/v1499354412/Screen_Shot_2017-06-09_at_5.13.34_PM_ogsjqt.png"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Dounan',
  last_name: 'Hu',
  group: 'LeWagon',
  email: "dounan@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: ' Involved in programming since the age of 16, I lived in the USA to conduct university-level projects of algorithms and serve the research of Astronomy'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1484535586/jjfugzyxtusvs9rczju7.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Maria',
  last_name: 'Altyeva',
  group: 'LeWagon',
  email: "maria@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'She moved to China in 2014 to explore the tech scene and is currently leading the development team at 5:IT'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1497405233/cnnnneepwwmlmmvts4h6.jpg"
student.photo_url = url
student.save!


student = User.new(
  first_name: 'Adrian',
  last_name: 'Pelegri',
  group: 'LeWagon',
  email: "Adrian@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: "I'm an awesome Teaching Assistant!"
  )
puts "saved a student user"
url = "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_330/v1499354745/Screen_Shot_2017-07-06_at_11.25.17_PM_ivrpqk.png"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Michaeljohn',
  last_name: 'Clement',
  group: 'LeWagon',
  email: "michaeljohn@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'He moved from the US to China in 2011 and believes many of the biggest opportunities for tech startups are found in the Middle Kingdom'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1487548942/i3euir5yvbgb9wtwlzdn.jpg"
student.photo_url = url
student.save!

student = User.new(
  first_name: 'Dimitri',
  last_name: 'Bosch',
  group: 'LeWagon',
  email: "dimitri@gmail.com",
  password: 'techforgood',
  password_confirmation: 'techforgood',
  bio: 'He has now found his passion, working as a freelance web developer while living in Japan!'
  )
puts "saved a student user"
url = "https://res.cloudinary.com/wagon/image/upload/c_fill,h_100,w_100/v1473855071/rjsqrp5csugzz3uw2hzb.jpg"
student.photo_url = url
student.save!







# Organization seeds
puts "creating organizations"

org = Organization.new(
  name: "Stratasys",
  description: "A manufacturer of 3D printers and 3D production systems for office-based rapid prototyping and direct digital manufacturing solutions"
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "Microsoft",
  description: "An American multinational technology company headquartered in Redmond, Washington. It develops, manufactures, licenses, supports and sells computer software, consumer electronics, personal computers, and services"
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "OxSight",
  description: "a University of Oxford venture that uses the latest smart glasses to improve sight for blind and partially sighted people"
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "DJI",
  description: "As the market leader in easy-to-fly drones and aerial photography systems, DJI quadcopters like the Phantom are the standard in consumer drone technology."
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "Google Tilt Brush",
  description: "Tilt Brush is a room scale 3D painting virtual reality application developed and published by Google. The software was released for Microsoft Windows on April 5, 2016"
  )
org.save!
puts "saved an org"

org = Organization.new(
  name: "OKCoin",
  description: "OKCoin is a Bitcoin company in China with core product lines of a Bitcoin exchange, and a mobile consumer payment and lending app"
  )
org.save!
puts "saved an org"


# Course seeds
puts "creating courses"

course = Course.new(
  title: "3D Printing",
  tagline: "Learn how to make 3d printed prosthetics for children in need",
  issue: "Prosthetics can involve a lot of work and expertise to produce and fit and the WHO says there is currently a shortage of 40,000 trained prosthetists in poorer countries. ",
  tech_solution: "Slowly but surely, 3D printing, has made it easier to build low cost customized prosthetics.  There are few commercial products that can suit custom sizes as needed.",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from Stratasys and Zhanyijihua",

  )
course.organization = Organization.find(1)

urls = [
  "https://www.rit.edu/news/lib/filelib/201402/talonhand1.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_330/v1499350323/Stratasys-3_iroanp.png"

]
course.photo_urls = urls

course.save!
puts "saved a course"



course = Course.new(
  title: "Computer Vision",
  tagline: "Help Microsoft's facial recognition tech to find missing children",
  issue: "Currently, there are millions of children who've gone missing in China.",
  tech_solution: "Slowly but surely, 3D printing, has made it easier to build low cost customized prosthetics.  There are few commercial products that can suit custom sizes as needed.",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from Stratasys and Zhanyijihua",

  )
course.organization = Organization.find(2)

urls = [
  "https://hothardware.com/ContentImages/NewsItem/35672/content/Microsoft_Emotion_Detection_2.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_340/v1499350449/Microsoft-Logo_d5uvez.png"

]
course.photo_urls = urls

course.save!
puts "saved a course"


course = Course.new(
  title: "Augmented Reality",
  tagline: "Augmented Reality for the visually-impaired",
  issue: "Blindness doesn't allow people to experience and interact with their surroundings to the fullest",
  tech_solution: "Slowly but surely, 3D printing, also known as additive manufacturing, has made it easier to build low cost customized prosthetics. Perhaps this is not surprising, given that its key benefit is to enable the rapid and cost-efficient creation of bespoke products. There are few commercial products that need to suit a wider variety of shapes and sizes than medical devices made for human beings",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from the Illinois MakerLab (the world's first 3D printing lab in a Business School) along with industry experts from both Autodesk (a leading 3D software firm) and Ultimaker (a leading 3D hardware firm).

"
  )
course.organization = Organization.find(3)

urls = [
  "https://www-tc.pbs.org/wgbh/nova/next/wp-content/uploads/2015/06/smart-specs.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_348/v1499350599/OxSight-logo_rhkwoc.png"
]
course.photo_urls = urls


course.save!
puts "saved a course"


course = Course.new(
  title: "Drones",
  tagline: "Build drones to help monitor forest fires and pollution",
  issue: "Blindness doesn't allow people to experience and interact with their surroundings to the fullest",
  tech_solution: "Slowly but surely, 3D printing, also known as additive manufacturing, has made it easier to build low cost customized prosthetics. Perhaps this is not surprising, given that its key benefit is to enable the rapid and cost-efficient creation of bespoke products. There are few commercial products that need to suit a wider variety of shapes and sizes than medical devices made for human beings",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from the Illinois MakerLab (the world's first 3D printing lab in a Business School) along with industry experts from both Autodesk (a leading 3D software firm) and Ultimaker (a leading 3D hardware firm).

"
  )
course.organization = Organization.find(4)

urls = [
  "http://res.cloudinary.com/techforgood/image/upload/v1499350844/Forest_fire_UAV_400x300_we9dls.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_378/v1499350735/dji_miaufs.png"
]
course.photo_urls = urls

course.save!
puts "saved a course"


course = Course.new(
  title: "Virtual Reality",
  tagline: "Promote arts advocacy to low-income areas with VR",
  issue: "Blindness doesn't allow people to experience and interact with their surroundings to the fullest",
  tech_solution: "Slowly but surely, 3D printing, also known as additive manufacturing, has made it easier to build low cost customized prosthetics. Perhaps this is not surprising, given that its key benefit is to enable the rapid and cost-efficient creation of bespoke products. There are few commercial products that need to suit a wider variety of shapes and sizes than medical devices made for human beings",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from the Illinois MakerLab (the world's first 3D printing lab in a Business School) along with industry experts from both Autodesk (a leading 3D software firm) and Ultimaker (a leading 3D hardware firm).

"
  )
course.organization = Organization.find(5)

urls = [
  "http://res.cloudinary.com/techforgood/image/upload/v1499351723/34099C6A00000578-3584512-Google_says_its_new_Tilt_Brush_VR_app_illustrated_enables_users_-a-14_1462963022363_bzmovm.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_284/v1499351744/1200px-Google_2015_logo.svg_d6p9cm.png"
]
course.photo_urls = urls

course.save!
puts "saved a course"


course = Course.new(
  title: "Blockchain",
  tagline: "Transparently fund-raise for disaster-stricken areas using blockchain",
  issue: "Blindness doesn't allow people to experience and interact with their surroundings to the fullest",
  tech_solution: "Slowly but surely, 3D printing, also known as additive manufacturing, has made it easier to build low cost customized prosthetics. Perhaps this is not surprising, given that its key benefit is to enable the rapid and cost-efficient creation of bespoke products. There are few commercial products that need to suit a wider variety of shapes and sizes than medical devices made for human beings",
  description:"This course will introduce you to the magic of 3D printing. Through a series of four cohesive courses and a hands-on capstone experience, you will acquire the knowledge, skills, and tools to turn your ideas into objects! This specialization has been developed by faculty experts from the Illinois MakerLab (the world's first 3D printing lab in a Business School) along with industry experts from both Autodesk (a leading 3D software firm) and Ultimaker (a leading 3D hardware firm).

"
  )
course.organization = Organization.find(6)

urls = [
  "http://res.cloudinary.com/techforgood/image/upload/v1499351837/e67718c8-35b9-47ad-be8b-94de27d22080_bs2zwl.jpg",
  "http://res.cloudinary.com/techforgood/image/upload/c_scale,w_179/v1499351964/logo1_nnimvo.png"
]
course.photo_urls = urls

course.save!
puts "saved a course"







# Lessons seeds
puts "Creating lessons"

lesson = Lesson.new(
  title: "A growing concern in China",
  text: "If you judged the country by its laws alone, China would be a global leader on disability rights. The ‘Laws on the Protection of Persons with Disabilities’, introduced in 1990, offer strong and wide-ranging protection of the civil rights of the disabled, guaranteeing employment, education, welfare, and access. But despite the high concerns of the law, Chinese cities make little concession to disabled people. As the sociologist Yu Jianrong has documented, raised pathways for the blind often lead into dead ends, bollards, trees or open pits, or else spiral decoratively but misleadingly. Wheelchair access is non-existent, especially outside Beijing or Shanghai, and guide dogs are effectively forbidden from most public spaces, despite the authorities’ repeated promises of full access.",
  description: "What's the situation like for Chinese children with physical disabilities",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 15,
  module_name: "why"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "Zhanyijihua's Solution",
  text: "Through the design, the production of economical simple 3D printing machinery prosthetics, and open source and dissemination of this technology, the wing plan hopes to help millions of children with physical disability in China.",
  description: "An introduction to our social impact",
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
  description: "How a small group of people are helping thousands",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNTYzODA4Mzk2/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 15,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "Our Story",
  text: "
Learn a little about the grassroots, open-source e-NABLE Community and our history!




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
  description: "An introduction to our partners stories",
  lesson_type: "article",
  video: "",
  minutes: 10,
  module_name: "what"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"




lesson = Lesson.new(
  title: "The 3D Printing Revolution",
  text: "This course will demonstrate how 3D printers work, show what people make with them, and examine the 3D printing ecosystem. It will also explore the future of 3D printing and discuss how this technology will revolutionize our world. The course materials include informative video lectures, on-location interviews with a variety of 3D printing experts, and engaging hands-on exercises. Learners who complete this introductory course will have a solid understanding of 3D printing and its revolutionary potential, and will be able to print and customize 3D designs. In addition, learners will obtain a preview of the other courses in the 3D Printing Specialization and gain an appreciation for how these courses will help them develop the knowledge and skills to turn their ideas into objects.

This course was listed in the top 50 MOOC's of all time by Class-Central (https://www.class-central.com/report/top-moocs/)",
  description: "How 3D printing is a game changer",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNjMxMTExMTQ0/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 20,
  module_name: "how"

  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Applications",
  text: "This course will help you understand how 3D printing is being applied across a number of domains, including design, manufacturing, and retailing. It will also demonstrate the special capabilities of 3D printing such as customization, self-assembly, and the ability to print complex objects. In addition to business applications, this course will also examine how individuals, including those in developing countries, are using this technology to create solutions to the problems they face. This course will also provide an overview of design thinking and how you can use this framework to develop ideas that can be turned into objects. Learners who complete this course will obtain a rich understanding of the capabilities of 3D printing and how to think about designing objects for this new technology.",
  description: "How are leading players using 3D printing technology",
  lesson_type: "article",
  video: "",
  minutes: 10,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How 3D printers work",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "What are the mechinics of a 3D printing machine",
  lesson_type: "quiz",
  video: "",
  minutes: 30,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Software",
  text: "This course will demonstrate how to use 3D printing software to create digital designs that can be turned into physical objects. It will also demonstrate how 3D scanners work to turn physical objects into digital designs. This course is hands-on in nature and will provide step-by-step instructions to guide you through two popular 3D modeling programs, Tinkercad and Fusion 360. Learners who complete this course will be able to use 3D software to design a wide variety of objects for both personal and professional use. In addition, learners who enroll in the course certificate will receive extended free access to Fusion 360 (provided by Autodesk).
",
  description: "How to write your own scripts for your 3D printer",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XNTAyOTcwMzgw/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 10,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Hardware",
  text: "This course will provide an in-depth exploration of desktop 3D printing hardware. It will examine the history of desktop 3D printing and demonstrate how 3D printers are made and how they work. This course will also provide step-by-step instructions for how to use and repair a 3D printer. It will also explore the different lesson_types of materials that can be 3D printed and will demonstrate how you can create various objects using these tools and materials. Learners who complete this course will be able to successfully operate, repair, and upgrade a 3D printer. In addition, learners who enroll in the course certificate will be able to purchase a desktop 3D printer at a discounted price (provided by Ultimaker).

If you enjoy this business course and are interested in an MBA, consider applying to the iMBA, a flexible, fully-accredited online MBA at an incredibly competitive price offered by the University of Illinois. For more information, please see the Resource page in this course and onlinemba.illinois.edu.",
  description: "What makes up a 3D printer?",
  lesson_type: "assignment",
  video: "",
  minutes: 30,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "3D Printing Capstone",
  text: "The capstone will integrate the learning acquired from the four courses in the 3D Printing Specialization through a hands-on project. This project will enable you to turn an idea into an object using the knowledge and skills acquired through the other courses. Specifically, you will be guided through a step-by-step process in which you imagine, design, make, and share a 3D printed object. Thus, through this capstone, you will be able to put course concepts into action and utilize the skills that you have acquired throughout the Specialization. In addition, you will be able to obtain an actual 3D print of the object you design at a discounted price through our corporate partners, 3D Hubs and Shapeways.",
  description: "Your final project for the course",
  lesson_type: "discussion",
  video: "",
  minutes: 15,
  module_name: "how"
  )
lesson.course = Course.find(1)
lesson.save!
puts "saved a lesson"




lesson = Lesson.new(
  title: "How Computer Vision Works",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "An introduction to Microsoft's technology",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(2)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How it can help",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "How face recognition works",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
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
  description: "What is Augmented Reality?",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"

lesson = Lesson.new(
  title: "How AR can help",
  text: "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla.
    Donec id elit non mi porta gravida at eget metus. Nullam quis risus eget urna mollis ornare vel eu leo. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Sed posuere consectetur est at lobortis. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
  description: "Is AR the Future?",
  lesson_type: "lecture",
  video: "<embed src='http://player.youku.com/player.php/sid/XMTU5OTM0MTIxMg==/v.swf' allowFullScreen='true' quality='high' width='100%' height='400' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed>",
  minutes: 30,
  module_name: "why"
  )
lesson.course = Course.find(3)
lesson.save!
puts "saved a lesson"




# Session seeds
puts "Creating sessions"


student = 1


15.times do

  # Enrollment seeds
  puts "creating enrollments"

  enrollment = Enrollment.new
  enrollment.course = Course.find(1)
  enrollment.user = User.find(student)
  enrollment.save!
  puts " enrollments saved"

  lesson_num = 1

  (1..9).to_a.sample.times do

    session = Session.new
    session.lesson = Lesson.find(lesson_num)
    session.user = User.find(student)
    session.enrollment = enrollment
    session.status = "completed"
    session.save!
    print "saved a lesson for"
    puts student

    lesson_num += 1
  end
  student += 1
end


32.times do

  student = User.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    group: "Glenbard South High School",
    email: Faker::Internet.email,
    password: 'techforgood',
    password_confirmation: 'techforgood'
    )
  url = "https://source.unsplash.com/collection/580685/200x200"
  student.photo_url = url
  student.save!
  puts "saved a student user"


  puts "creating enrollments"
  enrollment = Enrollment.new
  enrollment.course = Course.find(1)
  enrollment.user = student
  enrollment.status = "completed"
  enrollment.save!
  puts " enrollments saved"

end

14.times do

  student = User.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    group: "Glenbard South High School",
    email: Faker::Internet.email,
    password: 'techforgood',
    password_confirmation: 'techforgood'
    )
  url = "https://source.unsplash.com/collection/580685/200x200"
  student.photo_url = url
  student.save!
  puts "saved a student user"


  puts "creating enrollments"
  enrollment = Enrollment.new
  enrollment.course = Course.find(2)
  enrollment.user = student
  enrollment.status = "completed"
  enrollment.save!
  puts " enrollments saved"

end

12.times do

  student = User.new(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    group: "Glenbard South High School",
    email: Faker::Internet.email,
    password: 'techforgood',
    password_confirmation: 'techforgood'
    )
  url = "https://source.unsplash.com/collection/580685/200x200"
  student.photo_url = url
  student.save!
  puts "saved a student user"


  puts "creating enrollments"
  enrollment = Enrollment.new
  enrollment.course = Course.find(3)
  enrollment.user = student
  enrollment.status = "completed"
  enrollment.save!
  puts " enrollments saved"

end


