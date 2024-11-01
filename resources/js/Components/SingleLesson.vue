<script setup>
import { inject } from 'vue';
const swal = inject('$swal');
import DangerButton from '@/Components/DangerButton.vue';
import { useForm } from '@inertiajs/vue3';

const form = useForm({
    lesid: 0,
    colon: '',
    newvalue: ''
});

const props = defineProps({
    data: {
        type: Object
    },
    catlist: {
        type: Object
    }
});

const updateData = async (cid,colon,oldvalue) => {
    const inputValue = oldvalue;
    const { value: text } = await swal.fire({
        input: "text",
        inputLabel: colon + " değiştir",
        inputValue,
        inputPlaceholder: colon,
        inputAttributes: {
            "aria-label": colon
        },
        showCancelButton: true,
        cancelButtonText: "İptal",
        confirmButtonText: "Değiştir"
    });
    if (text) {
        form.lesid = cid;
        form.colon = colon;
        form.newvalue = text;
        form.patch(route('lesson.update'), {
            preserveScroll: true,
            onSuccess: () => swal.fire({icon:"success",title:"Veri başarıyla güncellendi #"+cid,showConfirmButton: false,timer:1500}),
            onFinish: () => form.reset()
        });
    }
};

const updateDataRadio = async (cid,colon,oldvalue) => {
    const inputValue = oldvalue ? '1': '0';
    const inputOptions = new Promise((resolve) => {
        setTimeout(() => {
            resolve({
                "1": "Evet",
                "0": "Hayır"
            });
        }, 100);
    });
    const { value: text } = await swal.fire({
        title: colon + " değiştir",
        input: "radio",
        inputValue,
        inputOptions,
        showCancelButton: true,
        cancelButtonText: "İptal",
        confirmButtonText: "Değiştir",
        inputValidator: (value) => {
            if (!value) {
                return "Birşey seçmek zorundasınız!";
            }
        }
    });
    if (text) {
        form.lesid = cid;
        form.colon = colon;
        form.newvalue = text;
        form.patch(route('lesson.update'), {
            preserveScroll: true,
            onSuccess: () => swal.fire({icon:"success",title:"Veri başarıyla güncellendi #"+cid,showConfirmButton: false,timer:1500}),
            onFinish: () => form.reset()
        });
    }
};
const updateDataSelect = async (cid,cats,oldvalue) => {
    const inputValue = oldvalue;
    const inputs = {};
    for(let i=0;i<cats.length;i++){
        inputs[cats[i].id] = cats[i].title;
    }
    const { value: newcat } = await swal.fire({
        title: "kategori değiştir",
        input: "select",
        inputValue,
        inputOptions: inputs,
        inputPlaceholder: "Kategori seçin",
        showCancelButton: true,
        cancelButtonText: "İptal",
        confirmButtonText: "Değiştir",
    });
    if (newcat) {
        form.lesid = cid;
        form.colon = 'category_id';
        form.newvalue = newcat;
        form.patch(route('lesson.update'), {
            preserveScroll: true,
            onSuccess: () => swal.fire({icon:"success",title:"Veri başarıyla güncellendi #"+cid,showConfirmButton: false,timer:1500}),
            onFinish: () => form.reset()
        });
    }
};
const deleteData = (cid,title) => {
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
            form.lesid = cid;
            form.delete(route('lesson.destroy'), {
                preserveScroll: true,
                onSuccess: () => swal.fire({icon:"success",title:"Veri başarıyla silindi #"+cid,showConfirmButton: false,timer:1500}),
                onFinish: () => form.reset()
            });
        }
    });
};

</script>
<template>
    <td class="px-6 py-4">{{ data.id }}</td>
    <td class="px-6 py-4">{{ data.title }}&nbsp;<button @click="updateData(data.id,'title',data.title)">✏️</button></td>
    <td class="px-6 py-4">{{ data.category.title }}&nbsp;<button @click="updateDataSelect(data.id,catlist,data.category_id)">✏️</button></td>
    <td class="px-6 py-4">{{ data.price }}&nbsp;<button @click="updateData(data.id,'price',data.price)">✏️</button></td>
    <td class="px-6 py-4">
        <span class="text-green-400" v-if="data.meb">Evet</span>
        <span class="text-red-700" v-else>Hayır</span>
        &nbsp;<button @click="updateDataRadio(data.id,'meb',data.meb)">✏️</button>
    </td>
    <td class="px-6 py-4">
        <span class="text-green-400" v-if="data.university">Evet</span>
        <span class="text-red-700" v-else>Hayır</span>
        &nbsp;<button @click="updateDataRadio(data.id,'university',data.university)">✏️</button>
    </td>
    <td class="px-6 py-4"><DangerButton @click="deleteData(data.id,data.title)">Sil</DangerButton></td>
</template>
