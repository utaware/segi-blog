// module
const { Service } = require('egg')
const fse = require('fs-extra') // https://www.colabug.com/3668248.html
// service
class FileService extends Service {
  // 文件相关操作
  // copy(src: string, dest: string, [options: object, callback: func])
  // 复制文件或目录，目录可以包含内容
  async copy (src, dest, options = {}) {
    // 拷贝
    return await fse.copy(src, dest, options).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // emptyDir(dir: string, [callback: function])
  // 确保目录为空。如果目录不为空，则删除目录内容。如果该目录不存在，则创建该目录。目录本身不会被删除。
  async emptyDir (src) {
    return await fse.emptyDir(src).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // ensureFile(file: string, [callback: func])
  // 确保文件存在。如果请求创建的文件位于不存在的目录中，则会创建这些目录。如果该文件已存在，则不进行修改。
  async ensureFile (file) {
    return await fse.ensureFile(file).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // ensureDir(dir: string, [callback: func])
  // 如果目录结构不存在，则创建它，如果目录存在，则不进行创建，类似mkdir -p。
  async ensureDir (dir) {
    return await fse.ensureDir(dir).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // move(src: string, dest: string, [options: object, callback: func])
  // 移动文件或目录，甚至跨设备
  async move (src, dest, options = {overwrite: true}) {
    return await fse.move(src, dest, options).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // outputFile(file: stirng, data: string|Buffer|Uint8Array, [options: string|object, callback: func])
  // 几乎与writeFile（即它覆盖）相同，除了如果父目录不存在，则创建它。file必须是文件路径（不允许使用缓冲区或文件描述符）
  async outputFile (file, data, options = {}) {
    return await fse.outputFile(file, data, options).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // outputJson(file: string, object: object, [options: object, callback: func])
  // 几乎相同writeJson，除了如果目录不存在，它就被创建了。
  async outputJson (file, object, options = {}) {
    return await fse.outputFile(file, object, options).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // readJson(file: string, [options: object, callback: func])
  // 读取JSON文件，然后将其解析为对象
  async readJson (file, options = {}) {
    return await fse.readJson(file, options).then((data) => {
      return data
    }).catch(() => {
      return null
    })
  }
  // remove(path: string, [callback: func])
  // 删除文件或目录。该目录可以包含内容
  async remove (path) {
    return await fse.remove(path).then(() => {
      return true
    }).catch(() => {
      return false
    })
  }
  // readFile(path: string)
  // 读取文件内容
  async readFile (path) {
    return await fse.readFile(path).then((data) => {
      return data.toString()
    }).catch(() => {
      return ''
    })
  }
}

module.exports = FileService