ActiveAdmin.register Course do
  permit_params :title, :organization_id, :description
end
