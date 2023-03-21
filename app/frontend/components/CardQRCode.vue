<template>
  <div
    class="card d-flex justify-content-center align-items-center mb-4"
    style="width: 18rem"
  >
    <i v-if="!qrCode" style="font-size: 6rem" class="bi bi-image-fill"></i>
    <img v-else :src="qrCode" class="card-img-top" alt="qrCode" />
  </div>
</template>

<script>
export default {
  name: "CardQRCode",
  props: ["qrCode"],
};
</script>
