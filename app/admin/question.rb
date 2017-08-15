ActiveAdmin.register Question do
  permit_params :lesson_id, :knowledge_point, :question, :option_a, :option_b, :option_c, :option_d, :answer, :_wysihtml5_mode

  form do |f|
    f.inputs "Question" do
      f.input :lesson_id
      f.input :knowledge_point
      f.input :question, as: :html_editor
      f.input :option_a
      f.input :option_b
      f.input :option_c
      f.input :option_d
      f.input :answer
    end
    f.actions
  end

end
