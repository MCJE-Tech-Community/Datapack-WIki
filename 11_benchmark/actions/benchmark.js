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

  for (let i = 0; i < results.results.length; i++) {
    const { group, benchmark, mode, count, score, error, unit } = results.results[i];
    const [namespace, path] = benchmark.split(':');
    const link = `https://github.com/MCJE-Tech-Shares/Datapack-WIki/blob/${context.sha}/11_benchmark/actions/world/datapacks/${group}/data/${namespace}/functions/${path}.mcfunction`;
    lines.push(`| ${group} | ${i === 0 ? `\`${benchmark}\`` : `[\`${benchmark}\`](${link})`} | ${mode} | ${count} | ${score} | ± ${error} | ${unit} |`);
  }

  const fs = require('fs');
  fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, lines.join('\n'));
};
