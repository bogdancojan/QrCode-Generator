<template>
  <div class="app">
    <h2 class="text-danger-emphasis mb-4">QR Code Generator</h2>
    <Form @qr-code-generated="setQrCode" />
    <CardQRCode :qrCode="qrCode" />
  </div>
</template>

<script>
import Form from "./components/Form.vue";
import CardQRCode from "./components/CardQRCode.vue";

export default {
  name: "App",
  data() {
    return {
      qrCode: "",
    };
  },
  methods: {
    setQrCode(qrCodeGenerated) {
      this.qrCode = qrCodeGenerated;
    },
  },
  components: {
    Form,
    CardQRCode,
  },
};
</script>

<style scoped>
.app {
  background-color: aquamarine;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
