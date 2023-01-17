import { Controller } from "@hotwired/stimulus"

const INPUT_ID = 'search-input'
const TEXT_INPUT_ID = 'query'

export default class extends Controller {
  connect () {
    const textInput = document.getElementById(TEXT_INPUT_ID);

    const searchInput = document.getElementById(INPUT_ID);
    
    textInput.addEventListener('focusout', () => {
      searchInput.value = true;
      this.element.requestSubmit();
      console.log(searchInput)
    });
    
    textInput.addEventListener('focusin', () => {
      searchInput.value = null;
    });
  }

  search() {
    clearTimeout(this.timeout);

    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 200);
  }
}
