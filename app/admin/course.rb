ActiveAdmin.register Course do
  permit_params :title, :organization_id, :description, :tagline,
  :issue, :tech_solution

end
