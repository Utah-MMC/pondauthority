/**
 * Image Animations - Pond Authority
 * Adds scroll-triggered fade-in animations to images
 */

(function() {
  'use strict';

  // Check if IntersectionObserver is supported
  if (!('IntersectionObserver' in window)) {
    console.log('IntersectionObserver not supported, skipping animations');
    return;
  }

  // Configuration
  const config = {
    threshold: 0.1, // Trigger when 10% of element is visible
    rootMargin: '0px 0px -50px 0px' // Start slightly before element enters viewport
  };

  // Create observer
  const observer = new IntersectionObserver(function(entries) {
    entries.forEach(function(entry) {
      // When element enters viewport
      if (entry.isIntersecting) {
        // Add animation class
        entry.target.classList.add('fade-in-up');
        
        // Optional: Stop observing after animation (for performance)
        observer.unobserve(entry.target);
      }
    });
  }, config);

  // Elements to animate
  const animateSelectors = [
    '.image-showcase-item',
    '.masonry-item',
    '.service-card',
    '.contractor-card',
    '.step',
    '.why-item',
    '.content-with-image-img'
  ];

  // Wait for DOM to be ready
  function initAnimations() {
    // Find and observe all elements
    animateSelectors.forEach(function(selector) {
      const elements = document.querySelectorAll(selector);
      
      elements.forEach(function(element) {
        // Set initial state (hidden)
        element.style.opacity = '0';
        
        // Start observing
        observer.observe(element);
      });
    });

    console.log('Image animations initialized');
  }

  // Initialize when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initAnimations);
  } else {
    initAnimations();
  }

  // Optional: Add lazy loading for images
  function initLazyLoading() {
    const images = document.querySelectorAll('img[data-src]');
    
    const imageObserver = new IntersectionObserver(function(entries) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.src = img.dataset.src;
          img.removeAttribute('data-src');
          imageObserver.unobserve(img);
        }
      });
    });

    images.forEach(function(img) {
      imageObserver.observe(img);
    });
  }

  // Uncomment to enable lazy loading (requires adding data-src attributes to images)
  // initLazyLoading();

})();

