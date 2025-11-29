# 🚀 Quick Reference - Image Effects

## Copy & Paste Examples

### 1. Parallax Background Section
```html
<section class="your-section section-with-bg">
  <div class="container">
    <h2>Your Title</h2>
    <p>Your content</p>
  </div>
</section>
```
Then add to `css/styles.css`:
```css
.your-section.section-with-bg {
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.97), rgba(255, 255, 255, 0.97)), 
                    url('../images/YOUR-IMAGE.jpeg');
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
}
```

### 2. Image Showcase Grid
```html
<section class="image-showcase">
  <div class="container">
    <h2>Gallery Title</h2>
    <div class="image-showcase-grid">
      <div class="image-showcase-item">
        <img src="../images/image1.jpg" alt="Description" />
        <div class="overlay-text">Category Name</div>
      </div>
      <div class="image-showcase-item">
        <img src="../images/image2.jpg" alt="Description" />
        <div class="overlay-text">Category Name</div>
      </div>
      <!-- Add 4-6 total items -->
    </div>
  </div>
</section>
```

### 3. Masonry Grid
```html
<div class="image-grid-masonry">
  <div class="masonry-item">
    <img src="image1.jpg" alt="Description" />
  </div>
  <div class="masonry-item">
    <img src="image2.jpg" alt="Description" />
  </div>
  <div class="masonry-item">
    <img src="image3.jpg" alt="Description" />
  </div>
  <!-- Every 3rd item will be taller -->
</div>
```

### 4. Alternating Image/Text
```html
<!-- Image LEFT, Text RIGHT -->
<div class="content-with-image">
  <div class="content-with-image-img">
    <img src="your-image.jpg" alt="Description" />
  </div>
  <div>
    <h2>Your Heading</h2>
    <p>Your content here...</p>
    <a href="#" class="btn btn-primary">Call to Action</a>
  </div>
</div>

<!-- Image RIGHT, Text LEFT -->
<div class="content-with-image reverse">
  <!-- Same structure -->
</div>
```

### 5. Hero with Background
```html
<section class="directory-hero" style="background-image: linear-gradient(135deg, rgba(240, 247, 255, 0.95) 0%, rgba(255, 255, 255, 0.93) 100%), url('../images/your-image.jpeg'); background-size: cover; background-position: center; background-attachment: fixed;">
  <div class="container">
    <h1>Page Title</h1>
    <p>Page description</p>
  </div>
</section>
```

---

## 🎨 Available CSS Classes

| Class | Purpose |
|-------|---------|
| `.hero-with-bg` | Parallax hero background |
| `.section-with-bg` | Parallax section background |
| `.image-showcase` | Showcase container |
| `.image-showcase-grid` | Showcase grid layout |
| `.image-showcase-item` | Showcase item with hover |
| `.image-grid-masonry` | Masonry grid |
| `.masonry-item` | Masonry item |
| `.content-with-image` | Alternating layout |
| `.content-with-image.reverse` | Reversed alternating |
| `.content-with-image-img` | Image container |
| `.image-overlay-card` | Gradient overlay effect |
| `.pulse-on-hover` | Pulse animation |
| `.fade-in-up` | Fade animation (auto) |

---

## 🔧 Common Tasks

### Copy More Images
```powershell
.\copy-pond-images.ps1
```

### Add Animation Script
```html
<script src="../js/image-animations.js" defer></script>
```

### Change Background Opacity
```css
/* More visible (less overlay) */
rgba(255, 255, 255, 0.85)

/* Less visible (more overlay) */
rgba(255, 255, 255, 0.98)
```

### Adjust Animation Speed
```css
.fade-in-up {
  animation: fadeInUp 0.8s ease-out forwards; /* Change 0.8s */
}
```

---

## 📄 Documentation Files

- **`IMAGE-USAGE-GUIDE.md`** - Full user guide with examples
- **`IMAGE-ENHANCEMENTS.md`** - Technical documentation
- **`IMPLEMENTATION-SUMMARY.md`** - What was implemented
- **`QUICK-REFERENCE.md`** - This file

---

## 🌐 Live Examples

- **Homepage** - Parallax backgrounds, showcase grid
- **Services** - Alternating layouts, hero background
- **Gallery** - Masonry grid, all effects combined

---

**Need Help?** Check the full guides!

