$path = "C:\Users\user\開発用\TAKE\HP\index.html"
$content = Get-Content -Path $path -Raw -Encoding UTF8
$targetBase64 = "ICAgICAgICAgICAgICAgICAgICA8aW1nIHNyYz0i55S75YOP6ZuGL+esrDfkvY3lhYXos57vvIjjg5njgrnjg4jjgrnjg57jgqTjg6vos57vvInjkmqLmsLTmp73lsYvjgZjjgqXjgZLjgoDjgIDlsI/mvqTjgbbjgajjgb/jgIDpo7Lpo5/luoHjgIDmtbfmsLQuanBnIiBhbHQ9IuOCouOCr+OCouODquOCpuODoOawtOanveODoeODs+ODh+ODiuODs+OCuSIgY2xhc3M9InNlcnZpY2UtaW1nIj4="
$replacementLine = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($targetBase64))
$regex = [regex]'(?s)(<div class="service-card fade-in-up delay-100">\s*?)<img src="[^"]*?" alt="[^"]*?" class="service-img">'
$newContent = $regex.Replace($content, "`${1}$replacementLine", 1)
$newContent | Set-Content -Path $path -NoNewline -Encoding UTF8
Write-Output "Fixed!"
