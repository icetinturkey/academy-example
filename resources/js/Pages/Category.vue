<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head,Link, useForm, usePage } from '@inertiajs/vue3';
import SingleCategory from "@/Components/SingleCategory.vue";
import { inject } from 'vue';
const swal = inject('$swal');

defineProps({
    catlist: {
        type: Object,
    },
});

const form = useForm({
    title: '',
});

const sendform = () => {
    form.post(route('category.add'), {
        preserveScroll: true,
        preserveState: false,
        onSuccess: () => swal.fire({icon:"success",title:"Kategori başarıyla eklendi #"+form.title,showConfirmButton: false,timer:1500}),
        onError: () => swal.fire({icon:"error",title:"Bir hata oluştu",showConfirmButton: false,timer:1500}),
        onFinish: () => form.reset()
    });
};
</script>

<template>
    <Head title="Kategoriler" />

    <AuthenticatedLayout>
        <template #header>
            <h2
                class="text-xl font-semibold leading-tight text-gray-800"
            >
                Kategoriler
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div
                    class="overflow-hidden bg-white shadow-sm sm:rounded-lg"
                >
                    <div class="p-6 text-gray-900">
                        <p class="text-2xl text-center mb-4">Yeni Kategori</p>
                        <form @submit.prevent="sendform">
                            <div class="flex items-center justify-center">
                            <div class="px-2">
                                <TextInput
                                    id="title"
                                    type="text"
                                    class="block w-full"
                                    v-model="form.title"
                                    required
                                    autofocus
                                    autocomplete="name"
                                />
                                <InputError class="mt-2" :message="form.errors.name" />
                            </div>
                            <div class="">
                                <PrimaryButton :disabled="form.processing">Ekle</PrimaryButton>
                            </div>
                            </div>
                        </form>
                        <p class="text-2xl text-center mb-4 mt-20">Tüm Kategoriler</p>
                        <table class="w-full text-sm text-left text-gray-500">
                            <thead class="text-gray-700 uppercase bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3">ID</th>
                                    <th scope="col" class="px-6 py-3">Başlık</th>
                                    <th scope="col" class="px-6 py-3">İşlem</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="cat in catlist" class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                    <SingleCategory :data="cat" />
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
