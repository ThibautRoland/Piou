import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post-message"
export default class extends Controller {

  tagId = null;

  static targets = ["tagDiv"]

  connect() {
    console.log("hello from post message controller");
    const token = document.querySelector("[name='csrf-token']").content
    console.log('token -> ', token)
  }

  addMessage(event) {
    console.log(this.tagId)
    if (!this.tagId) {
      alert("You need to choose a tag!")
      return
    }

    if (this.tagId) {
      event.preventDefault()
      const formData = new FormData(event.currentTarget);
      const content = formData.get('message')
      const message = {
        content: content,
        tag_id: this.tagId
      }

      this.postRequest(message)
    }
  }

  handleClick(event) {
    const messageTagId = event.currentTarget.dataset.tagid
    console.log('messageTagId', messageTagId)
    event.currentTarget.classList.toggle('bg-slate-400')
    this.tagId = this.tagId === messageTagId ? null : messageTagId
    console.log('this.tagId -> ', this.tagId)
    console.log('tagDivs -> ', this.tagDivTargets);
    this.tagDivTargets.forEach((div) => {
      if (div !== event.currentTarget) {
        div.classList.remove('bg-slate-400')
      }
    })
  }

  postRequest(data) {
    const token = document.querySelector("[name='csrf-token']").content

    fetch('http://localhost:3000/messages', {
      method: 'post',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": token
      },
      body: JSON.stringify(data)
    }).then(
      function(value) {
        console.log(value.url)
        window.location.href = value.url
      }
    )
  }


}
