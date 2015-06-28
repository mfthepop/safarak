module ReviewsHelper
  def reviews(reviews)
    reviews.map do |review|
      content_tag(:div, render(review))
    end.join.html_safe
  end
end