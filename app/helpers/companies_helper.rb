module CompaniesHelper

  def update_company_logo_link(company_logo)
      icon = image_tag "icons/image_edit.png"
      content_tag :li do
        if company_logo
          link_to icon + " update logo", edit_company_logo_path(company_logo)
        else
          link_to icon + " update logo", new_company_logo_path
        end
      end
  end

  def tax_type(company)
    if company.billed_date_relevant
      "Berechnete Betr&auml;ge"
    else
      "Vereinnahmte Betr&auml;ge"
    end
  end

end
