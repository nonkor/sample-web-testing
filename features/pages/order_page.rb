class OrderDetailsPage < Page
  p :notice, class: 'alert-success'

  def notice
    notice_p.text
  end
end
