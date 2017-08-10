ActiveAdmin.register Lesson do
  permit_params [:title, :video, :text, :description, :course_id]

  form do |f|
    f.inputs "Lesson" do
      f.input :title
      f.input :video
      f.input :text, as: :html_editor
      f.input :description
      f.input :course_id
    end
    f.actions
  end
end
