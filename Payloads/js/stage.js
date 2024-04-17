const { exec } = require('child_process');

// Adjust the path to where your compiled C# executable is located
const pathToExecutable = 'C:\\Users\\Public\\attck.exe';

exec(pathToExecutable, (error, stdout, stderr) => {
  if (error) {
    console.error(`exec error: ${error}`);
    return;
  }
  console.log(`stdout: ${stdout}`);
  console.error(`stderr: ${stderr}`);
});
