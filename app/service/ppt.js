'use strict';

const Converter = require('ppt-png')
const glob = require('glob');

const Service = require('egg').Service;

class PptService extends Service {
  async parse () {
    // console.log(123)
    glob('app/lib/ppt/*.ppt*', {}, (error, files) => {
        console.log(files);
        if(files) {
            new Converter({
                files: [files],
                output: 'app/lib/images',
                invert: true,
                deletePdfFile: false,
                outputType: 'jpg',
            }).run();
        }
    })
  }
}

module.exports = PptService;