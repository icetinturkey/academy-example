<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import Dropdown from '@/Components/Dropdown.vue';
import { Head,Link, useForm, usePage } from '@inertiajs/vue3';
import SingleLesson from "@/Components/SingleLesson.vue";
import {ref} from "vue";
import { inject } from 'vue';
const swal = inject('$swal');

defineProps({
    catlist: {
        type: Object,
    },
    leslist: {
        type: Object,
    },
});

const form = useForm({
    title: '',
    image: '',
    price: '',
    category_id: 0,
});

const sendform = () => {
    form.post(route('lesson.add'), {
        preserveScroll: true,
        preserveState: false,
        onSuccess: () => swal.fire({icon:"success",title:"Veri başarıyla eklendi #"+form.title,showConfirmButton: false,timer:1500}),
        onError: () => swal.fire({icon:"error",title:"Bir hata oluştu",showConfirmButton: false,timer:1500}),
        onFinish: () => form.reset()
    });
};

const changeselect = (cid,ctitle) => {
    form.category_id = cid;
    selectedctitle.value = ctitle;
};
const selectedctitle = ref("Kategori Seçin");
</script>

<template>
    <Head title="Eğitimler" />

    <AuthenticatedLayout>

        <template #header>
            <h2
                class="text-xl font-semibold leading-tight text-gray-800"
            >
                Eğitimler
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div
                    class="overflow-hidden bg-white shadow-sm sm:rounded-lg"
                >
                    <div class="p-6 text-gray-900">
                        <p class="text-2xl text-center mb-4">Yeni Eğitim</p>
                        <form @submit.prevent="sendform">
                            <div class="flex flex-col md:flex-row justify-center">
                                <div class="px-2">
                                    <InputLabel for="title" value="Eğitim Adı" />
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
                                <div class="px-2">
                                    <InputLabel for="img" value="Resim" />
                                    <TextInput
                                        id="img"
                                        type="text"
                                        class="block w-full"
                                        v-model="form.image"
                                        required
                                        autocomplete="name"
                                    />
                                    <InputError class="mt-2" :message="form.errors.name" />
                                </div>
                                <div class="px-2">
                                    <InputLabel for="price" value="Fiyatı" />
                                    <TextInput
                                        id="price"
                                        type="text"
                                        class="block w-full"
                                        v-model="form.price"
                                        required
                                        autocomplete="name"
                                    />
                                    <InputError class="mt-2" :message="form.errors.name" />
                                </div>
                                <div class="px-2 pt-6">
                                    <Dropdown align="right" width="48">
                                        <template #trigger>
                                        <span class="inline-flex rounded-md">
                                            <button
                                                type="button"
                                                class="inline-flex items-center rounded-md border border-transparent bg-white px-3 py-2 text-sm font-medium leading-4 text-gray-500 transition duration-150 ease-in-out hover:text-gray-700 focus:outline-none"
                                            >
                                                {{ selectedctitle }}

                                                <svg
                                                    class="-me-0.5 ms-2 h-4 w-4"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 20 20"
                                                    fill="currentColor"
                                                >
                                                    <path
                                                        fill-rule="evenodd"
                                                        d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                                        clip-rule="evenodd"
                                                    />
                                                </svg>
                                            </button>
                                        </span>
                                        </template>

                                        <template #content>
                                            <button v-for="cat in catlist" @click="changeselect(cat.id,cat.title)" class="block w-full px-4 py-2 text-start text-sm leading-5 text-gray-700 transition duration-150 ease-in-out hover:bg-gray-100 focus:bg-gray-100 focus:outline-none" type="button">{{cat.title}}</button>
                                        </template>
                                    </Dropdown>
                                </div>
                                <div class="pt-6">
                                    <PrimaryButton :disabled="form.processing">Ekle</PrimaryButton>
                                </div>
                            </div>
                        </form>
                        <p class="text-2xl text-center mb-4 mt-20">Tüm Eğitimler</p>
                        <table class="w-full text-sm text-left text-gray-500">
                            <thead class="text-gray-700 uppercase bg-gray-50">
                            <tr>
                                <th scope="col" class="px-6 py-3">ID</th>
                                <th scope="col" class="px-6 py-3">Başlık</th>
                                <th scope="col" class="px-6 py-3">Kategori</th>
                                <th scope="col" class="px-6 py-3">Fiyat</th>
                                <th scope="col" class="px-6 py-3">M.E.B Onay</th>
                                <th scope="col" class="px-6 py-3">Üniv. Onay</th>
                                <th scope="col" class="px-6 py-3">İşlem</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="les in leslist" class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                <SingleLesson :data="les" :catlist="catlist" />
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
