ActiveAdmin.register Lesson do
  permit_params [:title, :video, :text, :description, :course_id, :score]

  form do |f|
    f.inputs "Lesson" do
      f.input :course_id, :as => :select, :collection => Course.all
      f.input :module_name, :as => :select, :collection => ["why","what","how"]
      f.input :lesson_type, :as => :select, :collection => ["assignment","article","lecture","discussion","quiz"]
      f.input :title
      f.input :score
      f.input :video
      f.input :description
      f.input :text, as: :html_editor

    end
    f.actions
  end
end
