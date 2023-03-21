<template>
  <form class="container-fluid row g-3 w-50 mb-4" @submit.prevent="sendForm()">
    <div class="col-10">
      <div class="input-group">
        <span class="input-group-text" id="link-example"
          >https://example.com</span
        >
        <input
          type="text"
          class="form-control"
          aria-describedby="link-example"
          v-model.trim="form.url"
          :disabled="inactive"
        />
      </div>
    </div>
    <div class="col-1">
      <button class="btn btn-primary" type="submit">Save</button>
    </div>
    <div class="col-1">
      <button @click="cleanForm()" class="btn btn-danger" type="button">
        Cancel
      </button>
    </div>
  </form>
  <button
    v-if="qrCode"
    @click="downloadPNG"
    type="button"
    class="btn btn-success mb-4"
  >
    Download PNG
  </button>
</template>

<script>
export default {
  name: "Form",
  data() {
    return {
      inactive: false,
      qrCode: "",
      form: {
        url: "",
      },
    };
  },
  methods: {
    cleanForm() {
      this.form.url = "";
      this.inactive = false;
      this.qrCode = "";
    },

    async sendForm() {
      this.inactive = true;
      const res = await fetch("/apis/v1/qrcode/generate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ url: this.form.url }),
      });
      const data = await res.json();
      this.qrCode = "data:image/png;base64," + data.qr_code;
    },

    downloadPNG() {
      const link = document.createElement("a");
      link.href = "/apis/v1/qrcode/download?url=" + this.form.url;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      this.form.url = "";
      this.inactive = false;
      this.qrCode = "";
    },
  },
  watch: {
    qrCode(qrCodeGenerated) {
      this.$emit("qr-code-generated", qrCodeGenerated);
    },
  },
};
</script>
