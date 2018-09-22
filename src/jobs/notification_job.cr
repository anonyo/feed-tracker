class NotifcationJob < Mosquito::PeriodicJob
  run_every 1.minute

  def perform
    emotions = %w{happy sad angry optimistic political skeptical epuhoric}
    puts "The time is now #{Time.now} and the wizard is feeling #{emotions.sample}"
  end
end
