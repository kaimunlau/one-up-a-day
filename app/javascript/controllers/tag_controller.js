import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="tag"
export default class extends Controller {
  static targets = ["select"]

  static values = {
    tags: Array,
    postId: Number
  }

  connect() {
    this.#initializeTomSelect()
  }

  #handleChange = (value) => {
    this.tagsValue = value
  }

  handleSubmit = async (event) => {
    const response = await this.#postTags()
    const data = await response.json()
    if (data.status === 'ok') {
      window.location.href = '/'
    }
  }

  #postTags = () => {
    return fetch(`/update_posts/${this.postIdValue}/tag`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("meta[name=csrf-token]")?.content
      },
      body: JSON.stringify({ tags: this.tagsValue })
    })
  }

  #initializeTomSelect = () => {
    new TomSelect(this.selectTarget, {
      plugins: ['remove_button'],
      create: true,
      onChange: this.#handleChange
    })
  }
}
