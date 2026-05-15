document.addEventListener("DOMContentLoaded", () => {
  const navToggle = document.querySelector("[data-nav-toggle]");
  const nav = document.querySelector("[data-nav]");
  const searchLayer = document.querySelector("[data-search-layer]");
  const searchInput = document.querySelector("#site-search");
  const results = document.querySelector("#search-results");

  navToggle?.addEventListener("click", () => {
    nav?.classList.toggle("is-open");
  });

  const renderSearch = (query = "") => {
    if (!results) return;

    const normalized = query.trim().toLowerCase();
    results.replaceChildren();
    if (!normalized) return;

    const index = window.MUSK_ARCHIVE_INDEX || [];
    const matches = index.filter((item) => `${item.title} ${item.section} ${item.text}`.toLowerCase().includes(normalized));

    if (!matches.length) {
      return;
    }

    const fragment = document.createDocumentFragment();
    for (const item of matches) {
      const link = document.createElement("a");
      link.className = "search-result";
      link.href = item.url;

      const section = document.createElement("p");
      section.className = "tag";
      section.textContent = item.section;

      const title = document.createElement("h3");
      title.textContent = item.title;

      const text = document.createElement("p");
      text.textContent = item.text;

      link.append(section, title, text);
      fragment.append(link);
    }

    results.append(fragment);
  };

  const openSearch = (event) => {
    event?.preventDefault();
    if (!searchLayer) return;
    searchLayer.hidden = false;
    document.body.classList.add("has-search-open");
    if (searchInput) searchInput.value = "";
    results?.replaceChildren();
    window.setTimeout(() => searchInput?.focus(), 30);
  };

  const closeSearch = () => {
    if (!searchLayer) return;
    searchLayer.hidden = true;
    document.body.classList.remove("has-search-open");
  };

  document.querySelectorAll("[data-search-open]").forEach((trigger) => {
    trigger.addEventListener("click", openSearch);
  });

  document.querySelectorAll("[data-search-close]").forEach((trigger) => {
    trigger.addEventListener("click", closeSearch);
  });

  document.querySelectorAll("[data-person-open]").forEach((trigger) => {
    trigger.addEventListener("click", () => {
      const dialog = document.getElementById(trigger.dataset.personOpen);
      if (dialog?.showModal) {
        dialog.showModal();
      }
    });
  });

  document.querySelectorAll("[data-person-close]").forEach((trigger) => {
    trigger.addEventListener("click", () => {
      trigger.closest("dialog")?.close();
    });
  });

  document.querySelectorAll(".person-dialog").forEach((dialog) => {
    dialog.addEventListener("click", (event) => {
      if (event.target === dialog) dialog.close();
    });
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeSearch();
  });

  searchInput?.addEventListener("input", () => renderSearch(searchInput.value));

  document.querySelectorAll("[data-carousel]").forEach((carousel) => {
    const slides = Array.from(carousel.querySelectorAll("[data-carousel-slide]"));
    const previous = carousel.querySelector("[data-carousel-prev]");
    const next = carousel.querySelector("[data-carousel-next]");
    let current = 0;

    const show = (index) => {
      current = (index + slides.length) % slides.length;
      slides.forEach((slide, slideIndex) => {
        slide.classList.toggle("is-active", slideIndex === current);
      });
    };

    previous?.addEventListener("click", () => show(current - 1));
    next?.addEventListener("click", () => show(current + 1));

    if (slides.length > 1) {
      window.setInterval(() => show(current + 1), 5000);
    }
  });
});
