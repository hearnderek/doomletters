Function main([string]$phrase)
{
  if([string]::IsNullOrWhiteSpace($phrase))
  {
    $phrase = "HELLO WORLD"
  }
  to_doom $phrase
}


Function combine_many_letters([string[]] $letters)
{
  $comb = @("","","","","","","")
  [string[][]]$letters_split = @($letters | %{ $_.Split([System.Environment]::NewLine) | ?{![string]::IsNullOrWhiteSpace($_)} })
  for($in_index = 0; $in_index -lt $letters.Length;$in_index++)
  {
    for($index = 0; $index -lt $comb.Length-1; $index++)
    {
      $temp = $letters_split[$index+($in_index * ($comb.Length-1))]
      $comb[$index] += $temp
    }
  }
  [string]::Join([System.Environment]::NewLine, $comb)
}

Function combine_letters([string] $l1, [string] $l2)
{
  $comb = @("","","","","","","")
  $a_split = $l1.Split([System.Environment]::NewLine) | ?{![string]::IsNullOrWhiteSpace($_)}
  $b_split = $l2.Split([System.Environment]::NewLine) | ?{![string]::IsNullOrWhiteSpace($_)}
  for($in_index = 0; $in_index -lt $comb.Length;$in_index++)
  {
    $comb[$in_index] += $a_split[$in_index]
    $comb[$in_index] += $b_split[$in_index]
  }
  [string]::Join([System.Environment]::NewLine, $comb)
}


Function to_doom([string]$str)
{
  #Too lazy to deal with lower case as well
  $str = $str.ToLower()

  #for each letter get the specific string
  [string[]]$tmp = ([char[]]$str)|%{char_to_doom $_}
  $tmp = $tmp | ?{![string]::IsNullOrWhiteSpace($_)}
  (combine_many_letters $tmp).Replace("%20", "   ")
}

$percent = "
 _   __
(_) / /
   / / 
  / /  
 / / _ 
/_/ (_)"

$period = "
%20`
%20`
%20`
%20`
 _ `
(_)"

$foreward_slash = "
     __`
    / /`
   / / `
  / /  `
 / /   `
/_/    "
$back_slash = "
__     `
\ \    `
 \ \   `
  \ \  `
   \ \ `
    \_\"

$colon = "
 _ `
(_)`
%20`
 _ `
(_)`
%20"

$one = "
 __  `
/  | `
'| | `
 | | `
_| |_`
\___/"

$two = "
 _____ 
/ __  \
'' / /'
  / /  
./ /___
\_____/"

$three = "
 _____ 
|____ |
    / /
    \ \
.___/ /
\____/ "

$four = "
   ___ 
  /   |
 / /| |
/ /_| |
\___  |
    |_/"
$five = "
 _____ 
|  ___|
|___ \ 
    \ \
/\__/ /
\____/ "

$six = "
  ____ 
 / ___|
/ /___ 
| ___ \
| \_/ |
\_____/"

$seven = "
 ______
|___  /
   / / 
  / /  
./ /   
\_/    "

$eight = "
 _____ 
|  _  |
 \ V / 
 / _ \ 
| |_| |
\_____/"

$nine = "
 _____ 
|  _  |
| |_| |
\____ |
.___/ /
\____/ "

$zero = "
 _____ 
|  _  |
| |/. |
| ./| |
\ \_/ /
 \___/ "
$underscore = "
%20  %20
%20  %20
%20  %20
%20  %20
 ______ `
|______|"

$dash = "
%20  %20
%20  %20
 ______ `
|______|`
%20  %20
%20  %20"
$space = "
%20
%20
%20
%20
%20
%20"
$a = "
  ___   `
 / _ \  `
/ /_\ \ `
|  _  | `
| | | | `
\_| |_/ "
$b = "
______  `
|  __ \ `
| |_/ / `
|  __ \ `
| |_/ / `
\____/  "
$c = "
 _____  `
/  __ \ `
| /  \/ `
| |     `
| \__/\ `
 \____/ "
$d = "
______  `
| __  \ `
| | | | `
| | | | `
| |/ /  `
|___/   "
$e = "
______  `
|  ___| `
| |__   `
|  __|  `
| |___  `
\____/  "
$f = "
______  `
|  ___| `
| |_    `
|  _|   `
| |     `
\_|     "
$g = "
______  `
|  __ \ `
| |  \/ `
| | __  `
| |_\ \ `
\_____/ "
$h = "
__   __ `
| | | | `
| |_| | `
|  _  | `
| | | | `
\_| |_/ "
$i = "
 _____  `
|_   _| `
  | |   `
  | |   `
 _| |_  `
 \___/  "
$j = "
   ___  `
  |_  | `
    | | `
    | | `
/\__/ / `
\____/  "
$k = "
 _   __ `
| | / / `
| |/ /  `
|    \  `
| |\  \ `
\_| \_/ "
$l = "
 _      `
| |     `
| |     `
| |     `
| |____ `
\_____/ "
$m = "
___  ___ `
|  \/  | `
| .  . | `
| |\/| | `
| |  | | `
\_|  |_/ "
$n = "
__   __ `
| \ | | `
|  \| | `
| . ' | `
| |\  | `
\_| \_/ "
$o = "
 _____  `
| ___ | `
| | | | `
| | | | `
\ \_/ / `
 \___/  "
$p = "
______  `
| ___ \ `
| |_/ / `
|  __/  `
| |     `
\_|     "
$q = "
 _____  `
|  _  | `
| | | | `
| | | | `
\ \/' / `
 \_/\_\ "
$r = "
______  `
| ___ \ `
| |_/ / `
|    /  `
| |\ \  `
\_| \_| "
$s = "
 _____  `
/  ___| `
\ '--.  `
 '--. \ `
/\__/ / `
\____/  "
$t = "
 _____  `
|_   _| `
  | |   `
  | |   `
  | |   `
  \_/   "
$u = "
 _   _  `
| | | | `
| | | | `
| | | | `
| |_| | `
 \___/  "
$v = "
 _   _  `
| | | | `
| | | | `
\ \ / / `
 \ v /  `
  \_/   "
$w = "
__    __ `
| |  | | `
| |  | | `
| |/\| | `
\  /\  / `
 \/  \/  "
$x = "
__   __ `
\ \ / / `
 \ V /  `
 /   \  `
/ /^\ \ `
\/   \/ "
$y = "
__   __ `
\ \ / / `
 \ V /  `
  \ /   `
  | |   `
  \_/   "
$z = "
 ______ `
|___  / `
   / /  `
  / /   `
./ /___ `
\_____/ "

Function char_to_doom([char]$char)
{


  switch ($char)
  {
    'a'{$a}
    'b'{$b}
    'c'{$c}
    'd'{$d}
    'e'{$e}
    'f'{$f}
    'g'{$g}
    'h'{$h}
    'i'{$i}
    'j'{$j}
    'k'{$k}
    'l'{$l}
    'm'{$m}
    'n'{$n}
    'o'{$o}
    'p'{$p}
    'q'{$q}
    'r'{$r}
    's'{$s}
    't'{$t}
    'u'{$u}
    'v'{$v}
    'w'{$w}
    'x'{$x}
    'y'{$y}
    'z'{$z}
    ' '{$space}
    '-'{$dash}
    '_'{$underscore}
    '0'{$zero}
    '1'{$one}
    '2'{$two}
    '3'{$three}
    '4'{$four}
    '5'{$five}
    '6'{$six}
    '7'{$seven}
    '8'{$eight}
    '9'{$nine}
    '/'{$foreward_slash}
    '\'{$back_slash}
    '.'{$period}
    ':'{$colon}
    '%'{$percent}
    default{}
  }
}
