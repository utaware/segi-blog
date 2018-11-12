// 封装文件读取为promise便于文件的异步操作
const fs = require('fs')

module.exports = {
  // 
  async readFile (path) {
    return new Promise((resolve, reject) => {
      fs.readFile(path, 'utf8', (err, data) => {
        if (err) {
          return reject(err)
        }
        console.log(data)
        return resolve(data)
      })
    })
  }
}