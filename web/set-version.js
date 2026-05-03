const fs = require('fs');
const packageJson = require('./package.json');

const indexPath = './src/index.html';
const version = packageJson.version;

fs.readFile(indexPath, 'utf8', (err, data) => {
  if (err) {
    return console.log('Error reading index.html:', err);
  }

  const result = data.replace(/<html([^>]*)>/i, (match, attributes) => {
    const cleanAttributes = attributes
      .replace(/\bversion=["'][^"']*["']/gi, '')
      .replace(/\s+/g, ' ')
      .trim();
    const newAttributes = `${cleanAttributes}${cleanAttributes ? ' ' : ''}version="${version}"`;
    return `<html ${newAttributes}>`;
  });

  fs.writeFile(indexPath, result, 'utf8', (err) => {
    if (err) return console.log('Error writing index.html:', err);
    console.log(`Successfully injected version ${version} into index.html`);
  });
});
