$ErrorActionPreference = "Stop"

Remove-Item "_test_site" -Recurse -Force -ErrorAction SilentlyContinue
bundle exec jekyll build --destination "_test_site" | Out-Host

$homepage = Get-Content "_test_site/index.html" -Raw
$people = Get-Content "_test_site/people/index.html" -Raw
$searchJs = Get-Content "_test_site/assets/js/search.js" -Raw

function Assert-Contains($text, $needle, $message) {
  if (-not $text.Contains($needle)) {
    throw $message
  }
}

function Assert-NotContains($text, $needle, $message) {
  if ($text.Contains($needle)) {
    throw $message
  }
}

Assert-Contains $homepage 'href="https://www.spacex.com/"' "Popular Topics should link to official SpaceX page."
Assert-Contains $homepage 'href="https://www.tesla.com/"' "Popular Topics should link to official Tesla page."
Assert-Contains $homepage 'href="https://neuralink.com/"' "Popular Topics should link to official Neuralink page."
Assert-NotContains $homepage 'class="topic-pill" href="/search/" data-search-open' "Popular Topics should not open the search overlay."
Assert-Contains $homepage 'src="/assets/img/xai-card.svg"' "Homepage should use local xAI image asset."
Assert-Contains $homepage 'src="/assets/img/neuralink-card.svg"' "Homepage should use local Neuralink image asset."

Assert-NotContains $searchJs 'index.slice(0, 6)' "Search overlay should not render default result text before a query."
Assert-NotContains $searchJs 'Try SpaceX' "Search overlay should not show redundant helper result text."

Assert-Contains $people 'class="social-links"' "People cards should contain compact social icon links."
Assert-Contains $people 'aria-label="X / Twitter"' "People social links should include X/Twitter icon."
Assert-NotContains $people 'How to know them' "People cards should not show long contact text."
Assert-NotContains $people '<dt>Education</dt>' "People cards should not show long education details."
Assert-NotContains $people '<dt>Achievement</dt>' "People cards should not show long achievement details."
Assert-Contains $people 'class="mini-bio muted"' "People cards should include concise previous-company bios."

Write-Output "SITE_REGRESSION_OK"
