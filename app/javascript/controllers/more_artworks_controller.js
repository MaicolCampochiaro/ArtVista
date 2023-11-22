import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="more-artworks"
export default class extends Controller {
  connect() {
    this.displayedArtworks = 8;
  }

  showMore() {
    this.displayedArtworks += 8;
    this.fetchNextArtworks();
  }

  fetchNextArtworks() {
  }
}
