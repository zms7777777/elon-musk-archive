$ErrorActionPreference = "Stop"

Remove-Item "_test_site" -Recurse -Force -ErrorAction SilentlyContinue
bundle exec jekyll build --destination "_test_site" | Out-Host

$homepage = Get-Content "_test_site/index.html" -Raw
$people = Get-Content "_test_site/people/index.html" -Raw
$project = Get-Content "_test_site/project/index.html" -Raw
$collaborations = Get-Content "_test_site/collaborations/index.html" -Raw
$news = Get-Content "_test_site/news/index.html" -Raw
$searchJs = Get-Content "_test_site/assets/js/search.js" -Raw
$searchIndex = Get-Content "_test_site/assets/js/search-index.js" -Raw
$mainCss = Get-Content "assets/css/main.css" -Raw

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

Assert-Contains $homepage 'hero-carousel' "Homepage should place carousel under the title."
Assert-Contains $homepage 'Fan Lab' "Header and homepage should use Fan Lab branding."
Assert-Contains $homepage 'alt="Fan Lab - facilitators and neural image lab"' "Header should expose accessible full-image logo text."
Assert-Contains $homepage 'assets/img/fan-lab-logo-edited.png' "Header should reference Fan Lab logo asset."
Assert-Contains $homepage '<h1>Fan Lab</h1>' "Homepage hero title should be Fan Lab."
Assert-NotContains $homepage 'Elon Musk Archive' "Old header title should not appear on the homepage."
Assert-NotContains $homepage 'class="brand-copy"' "Header should not render separate brand text copy."
Assert-Contains $mainCss 'max-width: 140px;' "Header should show full logo at medium desktop size."
Assert-Contains $mainCss 'max-width: 118px;' "Header should show full logo at mobile size."
Assert-Contains $mainCss 'text-align: center;' "Homepage hero title should be centered."
Assert-NotContains $mainCss 'transform: scale(3.2)' "Header logo should not be cropped or scaled."
Assert-Contains $homepage 'hero-carousel-compact' "Homepage carousel should use compact centered sizing."
Assert-Contains $homepage 'class="home-intro intro-single"' "Homepage intro should be merged into one larger paragraph."
Assert-Contains $mainCss 'text-align: center;' "Homepage intro text should be centered."
Assert-NotContains $mainCss 'border-left: 4px solid var(--blue);
  border-radius: 20px;
  font-size: clamp(1.22rem, 2vw, 1.55rem);' "Homepage intro should not have a blue left border."
Assert-NotContains $homepage 'Explore our content by topic' "Popular Topics should be moved from homepage to Project page."
Assert-Contains $homepage 'assets/img/xai-card.svg' "Homepage should use local xAI image asset."
Assert-Contains $homepage 'assets/img/neuralink-card.svg' "Homepage should use local Neuralink image asset."

Assert-Contains $project 'Reusable Spaceflight' "Project page should include moved project topics."
Assert-Contains $project 'assets/img/project-ev-energy.svg' "Project page should use local EV image asset."
Assert-Contains $project 'assets/img/project-infrastructure.svg' "Project page should use local infrastructure image asset."
Assert-Contains $project 'Open official project source' "Project cards should link to official sources."
Assert-Contains $collaborations 'Tesla' "Collaborations page should include Tesla section."
Assert-Contains $collaborations 'SpaceX' "Collaborations page should include SpaceX section."
Assert-Contains $collaborations 'X.com' "Collaborations page should include X.com section."
Assert-Contains $collaborations 'class="shareholder-avatar"' "Collaborations should use shareholder avatar cards."
Assert-Contains $collaborations 'Elon_Musk_Colorado_2022' "Collaborations should include real Elon Musk avatar."
Assert-Contains $collaborations 'assets/img/avatar-vanguard.svg' "Collaborations should include local Vanguard avatar."
Assert-Contains $collaborations 'Larry_Ellison_picture.png' "Collaborations should include real Larry Ellison avatar."
Assert-Contains $collaborations 'The Vanguard Group' "Collaborations should include Tesla shareholder details."
Assert-Contains $collaborations 'Founders Fund' "Collaborations should include SpaceX investor details."
Assert-Contains $collaborations 'Larry Ellison' "Collaborations should include X.com investor details."
Assert-NotContains $collaborations 'stake-line' "Collaborations should not show long stake paragraphs."
Assert-NotContains $collaborations 'For customers reading this archive' "Collaborations should be simplified to short descriptions."
Assert-Contains $news '<h1>News</h1>' "Posts menu should be renamed to News."

Assert-NotContains $searchJs 'index.slice(0, 6)' "Search overlay should not render default result text before a query."
Assert-NotContains $searchJs 'Try SpaceX' "Search overlay should not show redundant helper result text."

Assert-Contains $people 'social-links detail-socials' "People dialogs should contain compact social icon links."
Assert-Contains $people 'aria-label="X / Twitter"' "People social links should include X/Twitter icon."
Assert-Contains $people 'data-person-open=' "People portraits should open detail dialogs."
Assert-Contains $people 'class="hover-profile"' "People portraits should show hover previews."
Assert-NotContains $people 'How to know them' "People cards should not show long contact text."
Assert-NotContains $people '<dt>Education</dt>' "People cards should not show long education details."
Assert-NotContains $people '<dt>Achievement</dt>' "People cards should not show long achievement details."
Assert-Contains $searchIndex 'section: "News"' "Search index should use News label."
Assert-Contains $searchIndex 'section: "Project"' "Search index should include projects."
Assert-Contains $searchIndex 'section: "Collaborations"' "Search index should include collaborations."

Write-Output "SITE_REGRESSION_OK"
