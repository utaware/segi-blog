const emoji = require('markdown-it-emoji')
const anchor = require('markdown-it-anchor')
const toc = require('markdown-it-table-of-contents')
const mi = require('markdown-it')
const Chain = require('markdown-it-chain')

const config = new Chain()

const render = function (data) {
  config.options   
  .html(true) // equal to .set('html', true)
  .linkify(true)
  .end()
  // emoji
  .plugin('emoji')
  .use(emoji)
  .end()
  // toc
  .plugin('toc')
  .use(toc, [{
    includeLevel: [2, 3],
    // format: parseHeaders
  }])
  .end()
  // anchor
  .plugin('anchor')
  .use(anchor, [{
    permalink: true,
    permalinkBefore: true,
    permalinkSymbol: '#'
  }])
  .before('toc')
  console.log(data)
  return config.toMd().render(data)
}

module.exports = {
  render (data) {
    config.options   
      .html(true) // equal to .set('html', true)
      .linkify(true)
      .end()
      // emoji
      .plugin('emoji')
      .use(emoji)
      .end()
      // toc
      .plugin('toc')
      .use(toc, [{
        includeLevel: [2, 3],
        // format: parseHeaders
      }])
      .end()
      // anchor
      .plugin('anchor')
      .use(anchor, [{
        permalink: true,
        permalinkBefore: true,
        permalinkSymbol: '#'
      }])
      .before('toc')
    console.log(data)
    return config.toMd().render(data)
  }
}