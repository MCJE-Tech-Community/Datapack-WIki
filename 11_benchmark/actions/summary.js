module.exports = (/** @type {{ context: { sha: string } }} */ { context }) => {
  const fs = require('fs');

  /**
   * @type {{
   *   mch_version: string,
   *   forks: number,
   *   jvm: string,
   *   jvm_args: string[],
   *   jdk_version: string,
   *   vm_name: string,
   *   vm_version: string,
   *   mc: string,
   *   mc_args: string[],
   *   mc_version: string,
   *   warmup_iteratino: number,
   *   warmup_time: string,
   *   measurement_iteration: number,
   *   measurement_time: string,
   *   results: {
   *     group: string,
   *     benchmark: string,
   *     mode: string,
   *     count: number,
   *     score: number,
   *     error: number,
   *     unit: string,
   *     scores: number[],
   *   }[],
   * }}
   */
  const results = require('./mch-results.json');

  const lines = [
    '<h3>Results</h3>',
    '<table>',
    '<thead>',
    '<tr>',
    '<th align="left">Group</th>',
    '<th align="left">Benchmark</th>',
    '<th align="center">Mode</th>',
    '<th align="right">Count</th>',
    '<th align="right">Score</th>',
    '<th align="right">Error</th>',
    '<th align="left">Unit</th>',
    '</tr>',
    '</thead>',
  ];

  for (let i = 0; i < results.results.length; i++) {
    const { group, benchmark, mode, count, score, error, unit } = results.results[i];
    /** @type {string} */
    let benchmarkTag;
    if (i === 0) {
      benchmarkTag = `<details><summary><code>${benchmark}</code></summary><pre lang="mcfunction"><code></code></pre></details>`;
    } else {
      const [namespace, path] = benchmark.split(':');
      const file = `world/datapacks/${group}/data/${namespace}/functions/${path}.mcfunction`;
      const href = `https://github.com/MCJE-Tech-Shares/Datapack-WIki/blob/${context.sha}/11_benchmark/actions/${file}`;
      const code = fs.readFileSync(`11_benchmark/actions/${file}`);
      benchmarkTag = `<details><summary><a href="${href}"><code>${benchmark}</code></a></summary><pre lang="mcfunction"><code>${code}</code></pre></details>`;
    }
    lines.push(
      '<tbody>',
      '<tr>',
      `<td align="left">${group}</td>`,
      `<td align="left">${benchmarkTag}</td>`,
      `<td align="center">${mode}</td>`,
      `<td align="right">${count}</td>`,
      `<td align="right">${score.toFixed(6)}</td>`,
      `<td align="right">± ${error.toFixed(6)}</td>`,
      `<td align="left">${unit}</td>`,
      '</tr>',
      '</tbody>',
    );
  }

  lines.push(
    '</table>',

    '<h3>Metadata</h3>',
    '<table>',
    '<thead>',
    '<tr>',
    '<th align="left">Key</th>',
    '<th align="left">Value</th>',
    '</tr>',
    '</thead>',
    `<tbody><tr><td align="left">mch_version</td><td align="left">${results.mch_version}</td></tr></tbody>`,
    `<tbody><tr><td align="left">forks</td><td align="left">${results.forks}</td></tr></tbody>`,
    `<tbody><tr><td align="left">jvm</td><td align="left">${results.jvm}</td></tr></tbody>`,
    `<tbody><tr><td align="left">jvm_args</td><td align="left">${results.jvm_args.join(' ')}</td></tr></tbody>`,
    `<tbody><tr><td align="left">jdk_version</td><td align="left">${results.jdk_version}</td></tr></tbody>`,
    `<tbody><tr><td align="left">vm_name</td><td align="left">${results.vm_name}</td></tr></tbody>`,
    `<tbody><tr><td align="left">vm_version</td><td align="left">${results.vm_version}</td></tr></tbody>`,
    `<tbody><tr><td align="left">mc</td><td align="left">${results.mc}</td></tr></tbody>`,
    `<tbody><tr><td align="left">mc_args</td><td align="left">${results.mc_args.join(' ')}</td></tr></tbody>`,
    `<tbody><tr><td align="left">mc_version</td><td align="left">${results.mc_version}</td></tr></tbody>`,
    `<tbody><tr><td align="left">warmup_iteratino</td><td align="left">${results.warmup_iteratino}</td></tr></tbody>`,
    `<tbody><tr><td align="left">warmup_time</td><td align="left">${results.warmup_time}</td></tr></tbody>`,
    `<tbody><tr><td align="left">measurement_iteration</td><td align="left">${results.measurement_iteration}</td></tr></tbody>`,
    `<tbody><tr><td align="left">measurement_time</td><td align="left">${results.measurement_time}</td></tr></tbody>`,
    '</table>',
  );

  fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, lines.join('\n'));
};
