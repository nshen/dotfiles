#!/usr/bin/env zx
$.verbose = false
console.log(chalk.blue("Create PR"));

try {
  await $`which gh`;
} catch {
  console.log(chalk.red("You need to install Github CLI"));
}

let tag = "";
const choices = ["chore", "feat", "fix", "maint", "build", "docs", "chore"]
while (tag === "") {
  tag = await question(`Tag? (${choices.join('/')}) `, {
    choices: choices,
  });
  if (!choices.includes(tag)) tag = "";
}

let id = "";
while (id === "") {
  id = await question(`ID? `);
}

let title = "";
while (title === "") {
  title = await question(`Title? `);
}

const prBody = `## Description

${title}

## Linear URL

\`https://linear.app/rss3/issue/${id}\`

`;

console.log(chalk.red(`!!!!!!!!!!!!!!!!!!!!!!!!`));

const prTitle = `${tag}(${id}): ${title}`;
console.log(chalk.green(prTitle));

const ready = await question(`Ready to create this PR? (y/n [n]) `);

if (ready.toLowerCase().startsWith("y")) {
  console.log(chalk.green(`Creating pr...`));
  await $`gh pr create --title ${prTitle} --body ${prBody}`;
} else {
  console.log(chalk.blue(`Canceled`));
}
