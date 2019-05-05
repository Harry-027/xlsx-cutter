const { handler } = require('./utils');

function Cutter(filePath) {
    this.filePath = filePath;
}

Cutter.prototype.cut = function() {
    handler(this.filePath);
}

module.exports = {
    Cutter
}