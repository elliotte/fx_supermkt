module Customers::PurchasesHelper
  def last_tr(purchase)
    content_tag :tr do
      (content_tag :td, purchase.deal.name) +
      (content_tag :td, purchase.amount) +
      (content_tag :td, (link_to 'Show', [:customers, purchase], title: 'Show' )) +
      (content_tag :td, (link_to 'Edit', edit_customers_purchase_path(purchase), model_options.merge(title: 'Edit'))) +
      (content_tag :td, (link_to 'Destroy', [:customers, purchase], method: :delete, data: { confirm: 'Are you sure?' }, title: 'Delete' ))
    end
  end
end
