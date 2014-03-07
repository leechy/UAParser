UAParser
========

Simple [Parser3](http://www.parser3.ru) version of the [ua-parser](https://github.com/tobie/ua-parser).
It uses ua-parser's regexes.yaml converted to json due to lack of YAML support in Parser3. Slightly modified to include some new UA's.


Usage
-----

Copy `uaparser` folder to your CLASS_PATH.

`@USE
uaparser/uaparser.p

@main[]
$r[^UAParser:parse[$env:HTTP_USER_AGENT]]
$r.ua.family
# -> "Mobile Safari"`

