module HomepageHelper

  def display_company_logo(company)
    image_tag company_logo_path(company.company_logo), :alt => "Company Logo", :style => "float:right;" if company.company_logo
  end
end
