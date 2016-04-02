module Scraper
  class  TimeTableScraper 
    def initialize login_params
      @url = "https://risyu.saitama-u.ac.jp/portal/"
      @account = login_params
      @time_table = {
        Mon:{
          mon1: "#ctl00_phContents_rrMain_ttTable_lctMon1_ctl00_lblSbjName",
          mon2: "#ctl00_phContents_rrMain_ttTable_lctMon2_ctl00_lblSbjName",
          mon3: "#ctl00_phContents_rrMain_ttTable_lctMon3_ctl00_lblSbjName",
          mon4: "#ctl00_phContents_rrMain_ttTable_lctMon4_ctl00_lblSbjName",
          mon5: "#ctl00_phContents_rrMain_ttTable_lctMon5_ctl00_lblSbjName",
          mon6: "#ctl00_phContents_rrMain_ttTable_lctMon6_ctl00_lblSbjName",
          mon7: "#ctl00_phContents_rrMain_ttTable_lctMon7_ctl00_lblSbjName"
        },
        Tue:{
          tue1: "#ctl00_phContents_rrMain_ttTable_lctTue1_ctl00_lblSbjName",
          tue2: "#ctl00_phContents_rrMain_ttTable_lctTue2_ctl00_lblSbjName",
          tue3: "#ctl00_phContents_rrMain_ttTable_lctTue3_ctl00_lblSbjName",
          tue4: "#ctl00_phContents_rrMain_ttTable_lctTue4_ctl00_lblSbjName",
          tue5: "#ctl00_phContents_rrMain_ttTable_lctTue5_ctl00_lblSbjName",
          tue6: "#ctl00_phContents_rrMain_ttTable_lctTue6_ctl00_lblSbjName",
          tue7: "#ctl00_phContents_rrMain_ttTable_lctTue7_ctl00_lblSbjName",
        },
        Wed:{
          wed1: "#ctl00_phContents_rrMain_ttTable_lctWed1_ctl00_lblSbjName",
          wed2: "#ctl00_phContents_rrMain_ttTable_lctWed2_ctl00_lblSbjName",
          wed3: "#ctl00_phContents_rrMain_ttTable_lctWed3_ctl00_lblSbjName",
          wed4: "#ctl00_phContents_rrMain_ttTable_lctWed4_ctl00_lblSbjName",
          wed5: "#ctl00_phContents_rrMain_ttTable_lctWed5_ctl00_lblSbjName",
          wed6: "#ctl00_phContents_rrMain_ttTable_lctWed6_ctl00_lblSbjName",
          wed7: "#ctl00_phContents_rrMain_ttTable_lctWed7_ctl00_lblSbjName",
        },
        Thu:{
          thu1: "#ctl00_phContents_rrMain_ttTable_lctThu1_ctl00_lblSbjName",
          thu2: "#ctl00_phContents_rrMain_ttTable_lctThu2_ctl00_lblSbjName",
          thu3: "#ctl00_phContents_rrMain_ttTable_lctThu3_ctl00_lblSbjName",
          thu4: "#ctl00_phContents_rrMain_ttTable_lctThu4_ctl00_lblSbjName",
          thu5: "#ctl00_phContents_rrMain_ttTable_lctThu5_ctl00_lblSbjName",
          thu6: "#ctl00_phContents_rrMain_ttTable_lctThu6_ctl00_lblSbjName",
          thu7: "#ctl00_phContents_rrMain_ttTable_lctThu7_ctl00_lblSbjName",
        },
        Fri:{
          fri1: "#ctl00_phContents_rrMain_ttTable_lctFri1_ctl00_lblSbjName",
          fri2: "#ctl00_phContents_rrMain_ttTable_lctFri2_ctl00_lblSbjName",
          fri3: "#ctl00_phContents_rrMain_ttTable_lctFri3_ctl00_lblSbjName",
          fri4: "#ctl00_phContents_rrMain_ttTable_lctFri4_ctl00_lblSbjName",
          fri5: "#ctl00_phContents_rrMain_ttTable_lctFri5_ctl00_lblSbjName",
          fri6: "#ctl00_phContents_rrMain_ttTable_lctFri6_ctl00_lblSbjName",
          fri7: "#ctl00_phContents_rrMain_ttTable_lctFri7_ctl00_lblSbjName",
        }
      }
    end


    def set_session
       Capybara.javascript_driver = :webkit
       @session = Capybara::Session.new(:webkit)
    end


    def fetch_time_table
      self.set_session
      @session.visit @url
      @session.fill_in 'txtID',    with: @account[:account] 
      @session.fill_in 'txtPassWord', with: @account[:password] 
      @session.click_button 'ログイン'
      @session.click_on '履修・成績情報'
      @session.click_on '履修時間割表'
      @result = [] 
      # ここでデータの永続化にかんする処理を行う 
      @time_table.each_value do |date|
        date.each_value do |unit|
          @result =  @session.find(unit).text
        end
      end
      @result
    end
  end
end
