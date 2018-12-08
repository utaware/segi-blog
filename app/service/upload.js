// module
const Service = require('egg').Service
const p = require('path')
// service
class UploadService extends Service {
  // 上传处理
  async files (file) {
    // mtime(创建时间) name(图片名) path(暂存路径) size(图片大小) type(文件格式)
    let { ctx } = this
    let { name, path, size, type } = file
    // 使用fse模块
    let fse = ctx.helper.fs
    // 以文件名后缀为upload下上传目录 (无后缀=>other)
    let dir = p.parse(name).ext.replace(/\W/g, '') || 'other'
    // 源文件路径解析 => 获得上传的文件名
    let basename = p.basename(path)
    // 复制的路径
    let dest = p.resolve(__dirname, '..', 'public/upload', dir, basename)
    // 上传后文件的相对路径 => 前端
    let src = p.join('/public/upload/', dir, basename).replace(/\\/g, '/')
    // 拷贝源文件
    return await fse.copy(path, dest).then(() => {
      // 删除源文件
      return fse.remove(path).then(() => {
        // 成功返回相关信息
        return { path: dest, name, size, type, src }
      }).catch((err) => {
        return ctx.throw(500, '文件删除错误')
      })
    }).catch((err) => {
      return ctx.throw(500, '文件拷贝错误')
    })
  }
}

module.exports = UploadService