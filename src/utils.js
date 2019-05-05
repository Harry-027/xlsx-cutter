const { exec } = require('child_process');

const invokeValidationProcess = function (filePath) {
    const childOne = exec(`cd ${__dirname} && sh checkWorkbook.sh ${filePath}`, (err, stdout, stderr) => {
        if (err) {
            console.error(`exec error: ${err}`);
            throw new Error('An error occurred while validating the workbook');
        }

        if (stderr) {
            console.error(`sheet error: ${stderr}`);
            throw new Error('Seems like validation failed. Sheet cannot be processed');
        }

        invokeSplitProcess(filePath);
    });

    childOne.on('close', () => {
        console.log('Workbook isn\'t corrupt...processing further...');
    });
}

function invokeSplitProcess(filePath) {
    const childTwo = exec(`cd ${__dirname} && sh splitWorkbook.sh ${filePath}`, (err, stdout, stderr) => {
        if (err) {
            console.error(`exec error: ${err}`);
            throw new Error('An error occurred while performing sheet split operation');
        }

        if (stderr) {
            console.error(`sheet error: ${stderr}`);
            throw new Error('Seems like there is some issue with sheet. Cannot be processed');
        }
    });

    childTwo.on('close', () => {
        console.log('Workbook split process completed successfully');
    });
}

const handler = function (filePath) {
    invokeValidationProcess(filePath);
}

module.exports = {
    handler
}