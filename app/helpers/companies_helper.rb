module CompaniesHelper

  def company_logo(company_logo)
    content_tag :div, :class => "company_logo" do
      if company_logo
        image_tag(company_logo_path(company_logo), :alt => "Company Logo")
      else
        image_tag("icons/user_suit.png", :alt => "Dummy Company Logo")
      end
    end
  end

  def update_company_logo_link(company_logo)
      content_tag :li do
        if company_logo
          link_to "Update Company Logo", edit_company_logo_path(company_logo)
        else
          link_to "Update Company Logo", new_company_logo_path
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
