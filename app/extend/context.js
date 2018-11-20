// 扩展this上下文

module.exports = {
  // 响应的方法
  end (...args) {

    let len = args.length

    let defaultRes = { code: 200, message: 'success', data: null }

    let code, message, data

    switch (len) {
        case 0:
            [{ code, message, data }] = [defaultRes]
            break
        case 1:
            [ { code, message, data } ] = args
            break
        case 2:
            [ code, { message, data } ] = args
            break
        case 3:
            [ code, message, data ] = args
            break
        default:
            [ code, message, ...data] = args
            break
    }

    if (Array.isArray(data)) {
        let check = data.every((v) => {
            return typeof(v) === 'object'
        })
        if (!check) console.log('Data parameter error at End')
        data = check ? Object.assign({}, ...data) : null
    }

    this.body = { code, message, data }
  }
}