# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

assets = Asset.create(
    (1..10).map do |n|
      {
        id: "#{n}",
        eff_dt: Time.now - 5.days,
        html_string: "<html><head><title>Demo #{n}</title></head><body><p>This is a sample demo #{n} details</p></body></html>",
        ver_nbr: n,
        title: "Demo #{n}",
        description: "This is a sample demo #{n} details"
      }
    end
  )

num = 123456
rec_num = 45678
assets.map do |asset|
  num = num + 1
  config = Config.new({
            cust_id: num,
            ntftn_id: num + 10,
            loan_nbr: "#{num + num}",
            asset_id: asset.id,
            actv_sts: "1"
          })

  if (config.valid? && config.save)
    rec_num = rec_num + 1
    AudLog.create({
        rec_id: rec_num,
        sent_dttm: Time.now,
        asset_id: asset.id,
        cust_id: config.cust_id,
        loan_nbr: config.loan_nbr,
        chnl: 'demo-chnl',
        sent_to: 'test@demo.com',
        ver_nbr: asset.ver_nbr,
        asset_eff_dt: asset.eff_dt,
      })
  end

end
