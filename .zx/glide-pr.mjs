#!/usr/bin/env zx
$.verbose = false
console.log(chalk.blue("Create glide PR"));

try {
  await $`which gh`;
} catch {
  console.log(chalk.red("You need to install Github CLI"));
}

let tag = "";
const choices = ["Chore", "Feat", "Fix", "Maint", "Build", "Docs", "Chore"]
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

const prBody = `[PR Guidelines Reference](https://docs.google.com/document/d/1D25n20Gp9xVIYMUWyUqKeeu3AXWmCcQRwlMRHUSF5f8/edit#bookmark=id.856qy8swlgg2)

[How to pass PR checks](https://docs.google.com/document/d/1i9GoQB1omWf245YYP3D_QCvnhA1buOki9o7juSjHRUI/edit#heading=h.hsuoc81zskwr)

## Description

${title}


Is this a [Risky PR](https://docs.google.com/document/d/1AJ4m6hg0nlp8CGlcK_tLyn2r0ufq-zPtmakvMbIifA8/edit#bookmark=id.3jiuksadtv96), including protobuf change or DB migration?
**If yes, STOP**. Follow the [Risky PR Release Process](https://docs.google.com/document/d/1AJ4m6hg0nlp8CGlcK_tLyn2r0ufq-zPtmakvMbIifA8/edit#bookmark=id.xx8htayraml0).

## Work Ticket

[QA: None]
https://compass-tech.atlassian.net/browse/${id}

## Automated Testing
Check at least 1

- [x] Unit tests
- [ ] e2e tests
- [ ] No automated testing is possible

## Test Plan

* Given: a particular input, user/system set up
* When: user/developer runs some commands, clicks buttons, follows a series of steps
* Then: what you expect to see as output, system behavior, UI changes

## Monitoring and Rollback Plan

If the PR is risky, this section is **mandatory**

**Monitoring**:
- What metrics will be monitored after deployment to staging?
- What metrics will be monitored after deployment to production?
- Are there alerts in place?

**Rollback**: 
- What are the rollback steps?
- Can feature flags be used instead of a rollback?

## Screenshots

If this is a UI change, show screenshots of the views you modified.

## Mandatory checklist to be completed by PR owner

- [x] Is this PR less than 400 lines of code (not counting tests)?
- [x] Did you check if this PR is risky and flag it if so?
- [x] Does this PR have a work ticket?
- [x] Is [Automated Testing](#Automated-Testing) filled out?
- [x] Is [Test Plan](#Test-Plan) filled out?
- [x] Did you check if [Monitoring and Rollback Plan](#Monitoring-and-Rollback-Plan) is applicable and fill it if so?
`;

console.log(chalk.red(`!!!!!!!!!!!!!!!!!!!!!!!!`));

const prTitle = `${tag}: [${id}] ${title}`;
console.log(chalk.green(prTitle));

const ready = await question(`Ready to create this PR? (y/n [n]) `);

if (ready.toLowerCase().startsWith("y")) {
  console.log(chalk.green(`Creating pr...`));
  await $`gh pr create --title ${prTitle} --body ${prBody}`;
} else {
  console.log(chalk.blue(`Canceled`));
}
