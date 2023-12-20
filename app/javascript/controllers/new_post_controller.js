import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="new-post"
export default class extends Controller {
  static targets = [
    "select",
    "titleGroup",
    "contentGroup"
  ]

  static values = {
    selectedTags: Array,
    tags: Array,
    postId: Number
  }

  connect() {
    this.isValidValue = false
    this.#loadTags()
  }

  handleSubmit = (event) => {
    event.preventDefault()
    const buildFormData = () => {
      const formData = new FormData(this.element)
      const formDataObject = {};
      for (const [key, value] of formData.entries()) {
        formDataObject[key] = value;
      }
      return formDataObject
    }

    const formData = buildFormData()
    if (this.#formIsValid(formData)) {
      this.#postUpdate(formData)
    }
  }

  #formIsValid = (formData) => {
    const clearPreviousValidation = () => {
      this.titleGroupTarget.classList.remove('bg-red-100')
      this.titleGroupTarget.querySelector('p')?.remove()

      this.contentGroupTarget.classList.remove('bg-red-100')
      this.contentGroupTarget.querySelector('p')?.remove()
    }

    const blockErrorStyle = 'bg-red-100'
    const errorMessage = '<p class="text-red-500 text-xs italic">Please fill out this field.</p>'

    clearPreviousValidation()

    if (formData.title.length > 0 && formData.content.length > 0) {
      return true
    }

    if (formData.title.length === 0) {
      this.titleGroupTarget.classList.add(blockErrorStyle)
      this.titleGroupTarget.insertAdjacentHTML('beforeend', errorMessage)
    }

    if (formData.content.length === 0) {
      this.contentGroupTarget.classList.add(blockErrorStyle)
      this.contentGroupTarget.insertAdjacentHTML('beforeend', errorMessage)
    }

    return false
  }

  #postUpdate = async (formDataObject) => {
    const postBody = {
      "title": formDataObject.title,
      "content": formDataObject.content
    }

    const response = await fetch('/update_posts', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("meta[name=csrf-token]")?.content
      },
      body: JSON.stringify({ update_post: postBody })
    })

    const data = await response.json()
    this.postIdValue = data.id

    if (this.tagsValue.length > 0 && this.postIdValue !== 0) {
      this.#postTags()
    }
  }

  #postTags = async () => {
    const response = await fetch(`/update_posts/${this.postIdValue}/tag`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("meta[name=csrf-token]")?.content
      },
      body: JSON.stringify({ tags: this.tagsValue })
    })
    const data = await response.json()

    if (data.status === 'ok') {
      window.location.href = `/`
    }
  }

  #initializeTomSelect = () => {
    new TomSelect(this.selectTarget, {
      plugins: ['remove_button'],
      create: true,
      onChange: this.#handleChange,
      options: this.tagsValue,
      closeAfterSelect: true
    })
  }

  #handleChange = (value) => {
    this.tagsValue = value
  }

  #loadTags = async () => {
    const response = await this.#fetchTags()
    const data = await response.json()
    this.tagsValue = data.map(tag => ({ value: tag, text: tag }))
    this.#initializeTomSelect()
  }

  #fetchTags = () => {
    return fetch(`/tags`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("meta[name=csrf-token]")?.content
      }
    })
  }
}
