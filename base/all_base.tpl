{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "8234") }}
socks-port: {{ default(global.clash.socks_port, "8235") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enable: true
  listen: :1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1,sequoia.apple.com
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5
http-listen = 127.0.0.1:8234
socks5-listen = 127.0.0.1:8235

[MITM]
skip-server-cert-verify = true
tcp-connection = true
hostname = api.zhihu.com, www.zhihu.com
ca-passphrase = GeekQu
ca-p12 = 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



[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
