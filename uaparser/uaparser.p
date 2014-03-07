@CLASS
UAParser

@OPTIONS
static

@auto[filespec]
#^throw[filespec;^filespec.match[(.+\/)(\.\./(.+\/))(.+)^$][g]{/$match.2}]
$regexesFile[^file::load[text;^filespec.match[(.+\/)(\.\./(.+\/))(.+)^$][g]{/$match.2}regexes.json]]
$regexesJSON[^untaint{$regexesFile.text}]
$regexes[^json:parse[$regexesJSON]]

@parse[str]
$result[
	$.ua[^self.parseUA[$str]]
	$.os[^self.parseOS[$str]]
	$.device[^self.parseDevice[$str]]
]

@parseUA[str]
$result[
	$.family[Other]
	$.major[]
	$.minor[]
	$.patch[]
]
^self.regexes.user_agent_parsers.foreach[k;v]{
	$m[^str.match[^untaint{$v.regex}]]
	^if($m){
		$result[
			$.family[^if(def $v.family_replacement){^v.family_replacement.replace[^$1;$m.1]}{$m.1}]
			$.major[^if(def $v.v1_replacement){$v.v1_replacement}{$m.2}]
			$.minor[^if(def $v.v2_replacement){$v.v2_replacement}{$m.3}]
			$.patch[^if(def $v.v3_replacement){$v.v3_replacement}{$m.4}]
		]
		^break[]
	}
}

@parseOS[str]
$result[
	$.family[Other]
	$.major[]
	$.minor[]
	$.patch[]
	$.patchMinor[]
]
^self.regexes.os_parsers.foreach[k;v]{
	$m[^str.match[^untaint{$v.regex}]]
	^if($m){
		$result[
			$.family[^if(def $v.os_replacement){^v.os_replacement.replace[^$1;$m.1]}{$m.1}]
			$.major[^if(def $v.os_v1_replacement){$v.os_v1_replacement}{$m.2}]
			$.minor[^if(def $v.os_v2_replacement){$v.os_v2_replacement}{$m.3}]
			$.patch[^if(def $v.os_v3_replacement){$v.os_v3_replacement}{$m.4}]
			$.patchMinor[^if(def $v.os_v4_replacement){$v.os_v4_replacement}{$m.5}]
		]
		^break[]
	}
}

@parseDevice[str]
$result[
	$.family[Other]
]
^self.regexes.device_parsers.foreach[k;v]{
	$m[^str.match[^untaint{$v.regex}]]
	^if($m){
		$result[
			$.family[^if(def $v.device_replacement){^v.device_replacement.replace[^$1;$m.1]}{$m.1}]
		]
		^break[]
	}
}
