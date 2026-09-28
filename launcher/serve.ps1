# Ledgerlens local server for Windows. Uses only built-in PowerShell, no installs needed.
# Serves the app folder at http://localhost:8765 and opens it in your default browser.
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$port = 8765
$prefix = "http://localhost:$port/"
$types = @{ ".html"="text/html; charset=utf-8"; ".js"="text/javascript; charset=utf-8"; ".webmanifest"="application/manifest+json";
            ".png"="image/png"; ".svg"="image/svg+xml"; ".md"="text/markdown; charset=utf-8"; ".json"="application/json" }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
try { $listener.Start() } catch {
  Write-Host "Port $port is busy. Ledgerlens may already be running; opening it now."
  Start-Process $prefix; Start-Sleep 3; exit
}
Write-Host ""
Write-Host "  Ledgerlens is running at $prefix"
Write-Host "  Keep this window open while you use it. Close it to stop."
Write-Host ""
Start-Process $prefix

while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
  if ($path -eq "") { $path = "index.html" }
  $file = [IO.Path]::GetFullPath((Join-Path $root $path))
  $res = $ctx.Response
  if ($file.StartsWith($root) -and (Test-Path $file -PathType Leaf)) {
    $bytes = [IO.File]::ReadAllBytes($file)
    $ext = [IO.Path]::GetExtension($file).ToLower()
    $res.ContentType = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
    $res.Headers.Add("Cache-Control", "no-cache")
    $res.OutputStream.Write($bytes, 0, $bytes.Length)
  } else { $res.StatusCode = 404 }
  $res.Close()
}
