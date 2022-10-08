import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [
      "sentence",
      "word",
      "step",
      "entityFormWrap",
      "wordStartIndexInput",
      "wordEndIndexInput",
      "entityTypeSelect",
      "entityTypeTextInput",
      "entityTypeColorInputWrap",
      "entityTypeColorInput",
    ]

    initialize() {
      this.step = 0 // initial state
    }

    connect () {
      this.showCurrentStep()
    }

    selectWord (event) {
      const wordIndex = event.currentTarget.dataset.wordIndex

      if (this.step == 0) this.wordStartIndexInputTarget.value = parseInt(wordIndex)
      if (this.step == 1) this.wordEndIndexInputTarget.value = parseInt(wordIndex)

      this.step = ((this.step + 1) % 3)

      if (this.step == 2) {
        this.entityFormWrapTarget.classList.remove('hidden')
      } else {
        this.entityFormWrapTarget.classList.add('hidden')
      }

      if (this.step == 0) {
        this.wordStartIndexInputTarget.value = ''
        this.wordEndIndexInputTarget.value = ''
      }

      this.reverseWordIndicesIfNecessary()
      this.showCurrentStep()
      this.renderSelectedWords()
    }

    showCurrentStep() {
      this.stepTargets.forEach((step, idx) => {
        if (idx != this.step) {
          step.classList.add('hidden')
        } else {
          step.classList.remove('hidden')
        }
      })
    }

    onEntityTypeSelect(event) {
      if (event.currentTarget.value === "") {
        this.entityTypeTextInputTarget.classList.remove('hidden')
        this.entityTypeColorInputWrapTarget.classList.remove('hidden')
        this.entityTypeTextInputTarget.disabled = false
        this.entityTypeColorInputTarget.disabled = false
      } else {
        this.entityTypeTextInputTarget.classList.add('hidden')
        this.entityTypeColorInputWrapTarget.classList.add('hidden')
        this.entityTypeTextInputTarget.disabled = true
        this.entityTypeColorInputTarget.disabled = true
      }
    }

    renderSelectedWords() {
      this.wordTargets.forEach((word) => {
        word.classList.remove('text-blue-600')
        word.classList.remove('text-red-600')
        word.classList.remove('hover:text-red-600')
        word.classList.remove('hover:text-blue-600')

        const wordIndex = parseInt(word.dataset.wordIndex)

        // Add start word hovering state for all words on initial step (no words selected)
        if (this.step == 0) word.classList.add('hover:text-blue-600')

        // Add end word hovering state for all words on second step (start word selected)
        if (this.step == 1) word.classList.add('hover:text-red-600')

        // Show the start word as selected (blue color)
        if (wordIndex === this.wordStartIndex()) {
          word.classList.add('text-blue-600')
        }

        // After selecting both words (start and end), highlight the whole selected tag
        if (this.step == 2 && wordIndex >= this.wordStartIndex() && wordIndex <= this.wordEndIndex()) word.classList.add('text-red-600')
      })
    }

    reverseWordIndicesIfNecessary() {
      if (this.wordStartIndex() > 0 && this.wordEndIndex() > 0 && this.wordStartIndex() > this.wordEndIndex()) {
        const end = this.wordEndIndexInputTarget.value
        this.wordEndIndexInputTarget.value = this.wordStartIndexInputTarget.value
        this.wordStartIndexInputTarget.value = end
      }
    }

    wordStartIndex() {
      return parseInt(this.wordStartIndexInputTarget.value)
    }

    wordEndIndex() {
      return parseInt(this.wordEndIndexInputTarget.value)
    }
}