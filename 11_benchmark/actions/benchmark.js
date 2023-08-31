module.exports = (/** @type {{ context: { sha: string } }} */ { context }) => {
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
    const [namespace, path] = benchmark.split(':');
    const link = `https://github.com/MCJE-Tech-Shares/Datapack-WIki/blob/${context.sha}/11_benchmark/actions/world/datapacks/${group}/data/${namespace}/functions/${path}.mcfunction`;
    const href = `href="${link}"`;
    lines.push(
      '<tbody>',
      '<tr>',
      `<td align="left">${group}</td>`,
      `<td align="left"><a ${href}><code>${benchmark}</code></a></td>`,
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

  const fs = require('fs');
  fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, lines.join('\n'));
};
