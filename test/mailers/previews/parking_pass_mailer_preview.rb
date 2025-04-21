# Preview all emails at http://localhost:3000/rails/mailers/parking_pass_mailer
class ParkingPassMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/parking_pass_mailer/send_pass
  def send_pass
    ParkingPassMailer.with(parking_pass: User.last.guests.first.parking_passes.last, guest: User.last.guests.first).send_pass
  end
end
