ActiveAdmin.register Lesson do
  permit_params :title, :video, :text, :description, :course_id
end
