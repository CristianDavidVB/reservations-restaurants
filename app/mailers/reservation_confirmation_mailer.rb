class ReservationConfirmationMailer < ApplicationMailer
  def reservation_confirmation(reservation)
    binding.break
    @reservation = reservation
    mail(to: @reservation.customer_email, subject: 'Your reservation has been confirmed')
  end
end
