ActiveAdmin.register User do
   permit_params [:email, :password, :password_confirmation, :admin]

  form do |f|
      f.inputs "User" do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :admin
      end
      f.actions
    end

end
