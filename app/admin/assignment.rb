ActiveAdmin.register Assignment do
  permit_params :course_id, :session_id, :lesson_id, :attempt, :user_answer, :mentor_feedback, :score

  # form do |f|
  #   f.inputs "Question" do
  #     f.input :lesson_id, :as => :select, :collection => Lesson.all

  #     f.input :knowledge_point, :as => :select, :collection => ["theory","definitions","reading"]
  #     f.input :question, as: :html_editor
  #     f.input :option_a
  #     f.input :option_b
  #     f.input :option_c
  #     f.input :option_d
  #     f.input :answer, :label => 'Correct Answer?...a, b, c, d?', :as => :select, :collection => ["a","b","c","d"]
  #   end
  #   f.actions
  # end

end

