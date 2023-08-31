module.exports = (/** @type {{ context: { sha: string } }} */ { context }) => {
  const fs = require('fs');

  /**
   * @type {{
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
      benchmarkTag = `<code>${benchmark}</code>`;
    } else {
      const [namespace, path] = benchmark.split(':');
      const file = `world/datapacks/${group}/data/${namespace}/functions/${path}.mcfunction`;
      const href = `https://github.com/MCJE-Tech-Shares/Datapack-WIki/blob/${context.sha}/11_benchmark/actions/${file}`;
      const code = fs.readFileSync(file);
      benchmarkTag = `<details><summary><a href="${href}"><code>${benchmark}</code></a></summary><pre lang="mcfunction"><code>${code}</code></pre></details>`;
    }
    lines.push(
      '<tbody>',
      '<tr>',
      `<td align="left">${group}</td>`,
      `<td align="left">${benchmarkTag}</td>`,
      `<td align="center">${mode}</td>`,
      `<td align="right">${count}</td>`,
      `<td align="right">${score}</td>`,
      `<td align="right">± ${error}</td>`,
      `<td align="left">${unit}</td>`,
      '</tr>',
      '</tbody>',
    );
  }

  lines.push('</table>');

  fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, lines.join('\n'));
};
