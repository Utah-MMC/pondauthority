const scrape = require('website-scraper').default || require('website-scraper');
const PuppeteerPlugin = require('website-scraper-puppeteer');
const path = require('path');

const options = {
  urls: ['https://nationalpondservice.com/'],
  directory: path.resolve(__dirname, 'nationalpondservice.com'),
  plugins: [
    new PuppeteerPlugin.default({
      launchOptions: {
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
      },
      scrollToBottom: {
        timeout: 10000,
        viewportN: 10
      },
      gotoOptions: {
        waitUntil: 'networkidle2',
        timeout: 30000
      }
    })
  ],
  recursive: true,
  maxDepth: 10,
  maxRecursiveDepth: 10,
  filenameGenerator: 'bySiteStructure',
  prettifyUrls: true,
  request: {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
      'Accept-Language': 'en-US,en;q=0.5',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Upgrade-Insecure-Requests': '1'
    }
  },
  urlFilter: (url) => {
    // Only download resources from nationalpondservice.com
    try {
      const urlObj = new URL(url);
      return urlObj.hostname === 'nationalpondservice.com' || 
             urlObj.hostname === 'www.nationalpondservice.com';
    } catch (e) {
      return true; // Allow relative URLs
    }
  },
  subdirectories: [
    {directory: 'img', extensions: ['.jpg', '.jpeg', '.png', '.gif', '.svg', '.webp']},
    {directory: 'js', extensions: ['.js']},
    {directory: 'css', extensions: ['.css']},
    {directory: 'fonts', extensions: ['.woff', '.woff2', '.ttf', '.eot']}
  ]
};

console.log('Starting to mirror nationalpondservice.com...');
console.log('This may take several minutes...');

scrape(options).then((result) => {
  console.log('Successfully mirrored the website!');
  console.log(`Downloaded ${result.length} files`);
}).catch((err) => {
  console.error('Error mirroring website:', err);
  process.exit(1);
});

