// module
const Service = require('egg').Service
const path = require('path')
// service
class UploadService extends Service {
  // 上传处理
  async files (files) {
    // mtime(创建时间) name(图片名) path(暂存路径) size(图片大小) type(文件格式)
    let fs = this.ctx.helper.fs
    files.forEach((v) => {
      // 移动源文件
    })
  }
}

module.exports = UploadService