<script setup>
import { inject } from 'vue';
const swal = inject('$swal');
import DangerButton from '@/Components/DangerButton.vue';
import { useForm } from '@inertiajs/vue3';

const form = useForm({
    catid: 0,
    title: ''
});

const props = defineProps({
    data: {
        type: Object
    }
});

const updateCategory = async (title,cid) => {
    const inputValue = title;
    const { value: text } = await swal.fire({
        input: "text",
        inputLabel: "Kategori adını değiştir",
        inputValue,
        inputPlaceholder: "kategori...",
        inputAttributes: {
            "aria-label": "kategori"
        },
        showCancelButton: true,
        cancelButtonText: "İptal",
        confirmButtonText: "Değiştir"
    });
    if (text) {
        form.catid = cid;
        form.title = text;
        form.patch(route('category.update'), {
            preserveScroll: true,
            onSuccess: () => swal.fire({icon:"success",title:"Kategori başarıyla güncellendi #"+cid,showConfirmButton: false,timer:1500}),
            onFinish: () => form.reset()
        });
    }
};
const deleteCategory = (title,cid) => {
    swal.fire({
        title: "Bu kaydı silmek istediğinize emin misiniz?",
        text: title,
        icon: "warning",
        showDenyButton: false,
        showCancelButton: true,
        confirmButtonText: "Sil",
        cancelButtonText: `İptal`
    }).then((result) => {
        if (result.isConfirmed) {
            form.catid = cid;
            form.title = title;
            form.delete(route('category.destroy'), {
                preserveScroll: true,
                onSuccess: () => swal.fire({icon:"success",title:"Kategori başarıyla silindi #"+cid,showConfirmButton: false,timer:1500}),
                onFinish: () => form.reset()
            });
        }
    });
};
</script>
<template>
    <td class="px-6 py-4">{{ data.id }}</td>
    <td class="px-6 py-4">{{ data.title }}&nbsp;<button @click="updateCategory(data.title,data.id)">✏️</button></td>
    <td class="px-6 py-4"><DangerButton @click="deleteCategory(data.title,data.id)">Sil</DangerButton></td>
</template>
