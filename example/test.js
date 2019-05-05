const path = require('path');
const Cutter = require('../src/index').Cutter;

const fileName = 'testfile.xlsx';
const filePath = path.join(__dirname, fileName);
const cutter = new Cutter(filePath);
cutter.cut();