ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

     columns do
       column do
         panel "Courses" do
           ul do
             Course.all.each do |course|
               li link_to(course.title, admin_course_path(course))
             end
           end
         end
       end
      end

      columns do
       column do
         panel "Organizations" do
           ul do
             Organization.all.each do |organization|
               li link_to(organization.name, admin_organization_path(organization))
             end
           end
         end
       end
      end
    # end
      end # content
end
