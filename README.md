# XLSX-cutter

### The Problem
Do you have a large excel workbook. And you want all contained xl sheets to move out in their own new workbook. 

### The Solution
XLSX-cutter can help you with same.
Simple micro-library that helps you to copy all the excel worksheets (from a given excel workbook) in their own new excel workbook.

### Note
Corrupt or locked workbooks cannot be processed. 

### Example
```

const path = require('path');
const Cutter = require('xlsx-cutter').Cutter;

const fileName = 'testfile.xlsx';
const filePath = path.join(__dirname, fileName);
const cutter = new Cutter(filePath);
cutter.cut();

```

### Installation
```
npm install xlsx-cutter

```

### LICENSE
MIT