#!/usr/bin/env ruby

# <bitbar.title>Brent Oil Price</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Roman Krasavtsev</bitbar.author>
# <bitbar.author.github>RomanKrasavtsev</bitbar.author.github>
# <bitbar.desc>Brent oil price from investing.com</bitbar.desc>
# <bitbar.image>https://raw.github.com/romankrasavtsev/brent-oil-bitbar-plugin/master/brent_oil_emoji.png</bitbar.image>
# <bitbar.dependencies>ruby</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/RomanKrasavtsev/brent-oil-bitbar-plugin</bitbar.abouturl>

require "nokogiri"
require "open-uri"

def get_rate
   user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"

   rate = Nokogiri::HTML(open("https://www.investing.com/commodities/brent-oil", 'User-Agent' => user_agent), nil, "UTF-8")
     .css(".pid-8833-last").first
     .to_s
     .gsub(/<span class="arial_26 inlineblock pid-8833-last" id="last_last" dir="ltr">/, "")
     .gsub(/<\/span>/, "")
     .gsub(/\./, ",")

   "🛢 #{rate}"
end

puts get_rate
