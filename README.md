UAParser
========

Simple [Parser3](http://www.parser3.ru) version of the [ua-parser](https://github.com/tobie/ua-parser).
It uses ua-parser's regexes.yaml converted to json due to lack of YAML support in Parser3. Slightly modified to include some new UA's.


Usage
-----

Copy `uaparser` folder to your CLASS_PATH.

```
@USE
uaparser/uaparser.p

@main[]
$r[^UAParser:parse[Mozilla/5.0 (iPhone^; CPU iPhone OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3]]

$r.ua.family
# -> "Mobile Safari"
$r.ua.major
# -> "5"
$r.ua.minor
# -> "1"

$r.os.family
# -> "iOS"
$r.os.major
# -> "5"
$r.os.minor
# -> "1"

$r.device.family
# -> "iPhone"
```

