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
    '### Results',
    '| Group | Benchmark | Mode | Count | Score | Error | Unit |',
    '| :---- | :-------- | :--- | ----: | ----: | ----: | :--- |',
  ];

  for (const result of results.results) {
    const [namespace, path] = result.benchmark.split(':');
    const link = `https://github.com/MCJE-Tech-Shares/Datapack-WIki/blob/${context.sha}/11_benchmark/actions/world/datapacks/${namespace}/data/${path}.mcfunction`;
    lines.push(`| ${result.group} | [\`${result.benchmark}\`](${link}) | ${result.mode} | ${result.count} | ${result.score} | ± ${result.error} | ${result.unit} |`);
  }

  const fs = require('fs');
  fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, lines.join('\n'));
};
