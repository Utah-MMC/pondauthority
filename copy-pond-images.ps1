# Copy Pond Images Script
# This script helps you copy beautiful pond images from pond_pics to your website

Write-Host "🌊 Pond Authority - Image Copy Tool" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Source and destination paths
$sourcePath = "I:\pond_pics"
$destPath = "I:\pondauthority\images"

# Check if paths exist
if (-not (Test-Path $sourcePath)) {
    Write-Host "❌ Error: Source path not found: $sourcePath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $destPath)) {
    Write-Host "❌ Error: Destination path not found: $destPath" -ForegroundColor Red
    exit 1
}

Write-Host "📂 Source: $sourcePath" -ForegroundColor Yellow
Write-Host "📂 Destination: $destPath" -ForegroundColor Yellow
Write-Host ""

# Get all enhanced images (prioritize high-quality versions)
$enhancedImages = Get-ChildItem -Path $sourcePath -Filter "*-enhance-4x.jpeg" | Select-Object -First 20
$denoisedImages = Get-ChildItem -Path $sourcePath -Filter "*-denoise-enhance-4x.jpeg" | Select-Object -First 20

Write-Host "📊 Found:" -ForegroundColor Green
Write-Host "   - $($enhancedImages.Count) enhanced 4x images" -ForegroundColor White
Write-Host "   - $($denoisedImages.Count) denoised enhanced 4x images" -ForegroundColor White
Write-Host ""

# Combine and get unique images
$allImages = $enhancedImages + $denoisedImages | Sort-Object Name -Unique

Write-Host "🎯 Action Options:" -ForegroundColor Cyan
Write-Host "1. Copy 10 random high-quality images" -ForegroundColor White
Write-Host "2. Copy 20 random high-quality images" -ForegroundColor White
Write-Host "3. Copy specific images (interactive)" -ForegroundColor White
Write-Host "4. Copy ALL enhanced images (not recommended - large)" -ForegroundColor White
Write-Host "5. Exit" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter your choice (1-5)"

switch ($choice) {
    "1" {
        $selectedImages = Get-Random -InputObject $allImages -Count 10
        Write-Host "`n📋 Copying 10 random images..." -ForegroundColor Green
    }
    "2" {
        $selectedImages = Get-Random -InputObject $allImages -Count 20
        Write-Host "`n📋 Copying 20 random images..." -ForegroundColor Green
    }
    "3" {
        Write-Host "`nℹ️  Opening interactive selection..." -ForegroundColor Yellow
        $selectedImages = $allImages | Out-GridView -Title "Select images to copy" -PassThru
        if ($selectedImages.Count -eq 0) {
            Write-Host "❌ No images selected. Exiting." -ForegroundColor Red
            exit 0
        }
    }
    "4" {
        $confirm = Read-Host "⚠️  This will copy $($allImages.Count) images. Continue? (y/n)"
        if ($confirm -ne 'y') {
            Write-Host "❌ Operation cancelled." -ForegroundColor Red
            exit 0
        }
        $selectedImages = $allImages
    }
    "5" {
        Write-Host "👋 Goodbye!" -ForegroundColor Cyan
        exit 0
    }
    default {
        Write-Host "❌ Invalid choice. Exiting." -ForegroundColor Red
        exit 1
    }
}

# Copy the selected images
$copiedCount = 0
$skippedCount = 0

foreach ($image in $selectedImages) {
    $destFile = Join-Path -Path $destPath -ChildPath $image.Name
    
    # Check if file already exists
    if (Test-Path $destFile) {
        Write-Host "⏩ Skipping (already exists): $($image.Name)" -ForegroundColor DarkGray
        $skippedCount++
    }
    else {
        Copy-Item -Path $image.FullName -Destination $destFile -Force
        Write-Host "✅ Copied: $($image.Name)" -ForegroundColor Green
        $copiedCount++
    }
}

Write-Host ""
Write-Host "🎉 Done!" -ForegroundColor Cyan
Write-Host "   - Copied: $copiedCount images" -ForegroundColor Green
Write-Host "   - Skipped: $skippedCount images (already existed)" -ForegroundColor Yellow
Write-Host ""
Write-Host "💡 Tips:" -ForegroundColor Cyan
Write-Host "   - Add these images to your gallery.html page" -ForegroundColor White
Write-Host "   - Use them as section backgrounds" -ForegroundColor White
Write-Host "   - Update alt text for SEO" -ForegroundColor White
Write-Host "   - See IMAGE-ENHANCEMENTS.md for usage examples" -ForegroundColor White
Write-Host ""

