<script setup>

import PrimaryButton from '@/Components/PrimaryButton.vue';
import { useForm } from '@inertiajs/vue3';



const props = defineProps({
    data: {
        type: Object
    }
});



</script>
<template>


    <div class="max-w-[270px] relative block bg-white border border-gray-200 rounded-lg shadow flex flex-col justify-between">
        <img class="rounded-t-lg" v-bind:src="data.image" alt="resim yüklenemedi" />
        <span v-if="data.meb" class="bg-indigo-100 text-indigo-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded absolute top-2 left-2">M.E.B. Onaylı</span>
        <span v-if="data.university" class="bg-green-100 text-green-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded absolute top-2 right-2">Üniversite Onaylı</span>
        <div class="p-5 h-full flex flex-col justify-between">
            <div class="mb-2 text-2xl font-bold tracking-tight text-gray-900 text-center h-full flex items-center justify-center">{{ data.title }}</div>
            <div class="flex justify-center">
            <PrimaryButton v-if="data.price > 0">{{data.price}} ₺</PrimaryButton>
            <PrimaryButton v-else>Kapalı</PrimaryButton>
            </div>
        </div>
    </div>


</template>
