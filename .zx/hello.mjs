#!/usr/bin/env zx

console.log(chalk.blue("Checking if rg exists..."));
try {
  await $`which rg1`;
  console.log(chalk.green("You already have rg, awesome!"));
} catch {
  console.log(chalk.red("Nope, installing rg (rigrep)"));

  // await $`brew install ripgrep`
}

// await $`cp -i ./hello ./hello2`

const homeDir = os.homedir();
console.log(chalk.blue(`Copying .vimrc to ${homeDir}/.vimrc`));

/* if (fs.exists(`${homeDir}/.vimrc`)) {
  const overwrite = await question(
    `Do you want to overwrite ${homeDir}/.vimrc? (y/n [n]) `
  );

  if (overwrite.toLowerCase().startsWith("y")) {
    console.log(chalk.green(`Overwriting ${homeDir}/.vimrc`));
    await $`cp .vimrc ${homeDir}/.vimrc`;
  } else {
    console.log(chalk.blue(`Not overwritting ${homeDir}/.vimrc`));
  }
} else {
  await $`cp .vimrc ${homeDir}/.vimrc`;
} */


  const overwrite = await question(
    `Do you want to overwrite ${homeDir}/.vimrc? (y/n [n]) `
  );

console.log(overwrite)

// https://github.com/nikolalsvk/dotfiles/blob/master/install.mjs
