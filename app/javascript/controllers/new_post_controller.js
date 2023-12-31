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
    postId: Number,
    blockErrorStyle: String
  }

  connect() {
    this.blockErrorStyleValue = 'bg-red-100'
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
    const errorMessage = '<p class="text-red-500 text-xs italic">Please fill out this field.</p>'

    const setError = (element) => {
      element.classList.add(this.blockErrorStyleValue)
      element.insertAdjacentHTML('beforeend', errorMessage)
    }

    this.#removeError(this.titleGroupTarget)
    this.#removeError(this.contentGroupTarget)

    if (formData.title.length > 0 && formData.content.length > 0) {
      return true
    }

    if (formData.title.length === 0) {
      setError(this.titleGroupTarget)
    }

    if (formData.content.length === 0) {
      setError(this.contentGroupTarget)
    }

    return false
  }

  handleCancel = () => {
    this.#removeError(this.titleGroupTarget)
    this.#removeError(this.contentGroupTarget)
  }

  #removeError = (element) => {
    element.classList.remove(this.blockErrorStyleValue)
    element.querySelector('p')?.remove()
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

    if (this.selectedTags && this.postIdValue !== 0) {
      this.#postTags()
    } else {
      window.location.href = `/`
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
