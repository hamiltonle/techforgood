ActiveAdmin.register Assignment do
  permit_params :session_id, :lesson_id, :attempt, :user_answer, :mentor_feedback, :score

  form do |f|
    f.inputs "Assignment" do
      f.input :lesson_id, :as => :select, :collection => Lesson.all
      f.input :session_id, :as => :select, :collection => Session.all

      f.input :attempt, :as => :select, :collection => [1,2]
      f.input :user_answer
      f.input :mentor_feedback, as: :html_editor
      f.input :score, :as => :select, :collection => [1,2,3,4,5]
    end
    f.actions
  end

end

