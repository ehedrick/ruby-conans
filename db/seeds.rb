Question.create language: 'ruby', text: '[0][1]'
Question.create language: 'ruby', text: "%s'%%s's'"
Question.create language: 'ruby', text: "''<<''"
Question.create language: 'ruby', text: "'CONAN'.codepoints.reduce(:+)"
Question.create language: 'ruby', text: "'^\^'.count('^\^')"
Question.create language: 'ruby', text: "'a-e-i-o-u'.delete(*%w'a-i a-e')"
Question.create language: 'ruby', text: "'suck'.succ"
Question.create language: 'ruby', text: "'oct'.oct"
Question.create language: 'ruby', text: "(67.chr*5).scan(/(..)(..)/)"
Question.create language: 'ruby', text: "','.split(',',-1)"
Question.create language: 'ruby', text: "'CONAN'.squeeze('CONAN')"
Question.create language: 'ruby', text: "'cup'.tr(*%w'up p')"

