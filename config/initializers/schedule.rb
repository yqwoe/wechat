require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new

scheduler.cron '00 09 * * *' do  #每天早上8点执行一次任务
  puts '每天早上8点执行一次任务'
end