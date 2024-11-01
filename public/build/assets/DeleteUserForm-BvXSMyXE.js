import{p as B,q as C,s as D,h as $,o as x,c as E,a,w as r,i as f,x as y,b as s,y as p,n as h,r as b,g as S,z as V,f as _,m as v,T as U,A,d as w,u as c,B as T}from"./app-DbhmOsd_.js";import{D as g}from"./DangerButton-C9j67Q1Y.js";import{_ as N,a as z}from"./TextInput-DFbMROIu.js";import{_ as M}from"./InputLabel-Bj2iezlx.js";import"./_plugin-vue_export-helper-DlAUqK2U.js";const O={class:"fixed inset-0 z-50 overflow-y-auto px-4 py-6 sm:px-0","scroll-region":""},P={__name:"Modal",props:{show:{type:Boolean,default:!1},maxWidth:{type:String,default:"2xl"},closeable:{type:Boolean,default:!0}},emits:["close"],setup(l,{emit:n}){const o=l,t=n;B(()=>o.show,()=>{o.show?document.body.style.overflow="hidden":document.body.style.overflow=null});const u=()=>{o.closeable&&t("close")},i=m=>{m.key==="Escape"&&o.show&&u()};C(()=>document.addEventListener("keydown",i)),D(()=>{document.removeEventListener("keydown",i),document.body.style.overflow=null});const d=$(()=>({sm:"sm:max-w-sm",md:"sm:max-w-md",lg:"sm:max-w-lg",xl:"sm:max-w-xl","2xl":"sm:max-w-2xl"})[o.maxWidth]);return(m,e)=>(x(),E(V,{to:"body"},[a(p,{"leave-active-class":"duration-200"},{default:r(()=>[f(s("div",O,[a(p,{"enter-active-class":"ease-out duration-300","enter-from-class":"opacity-0","enter-to-class":"opacity-100","leave-active-class":"ease-in duration-200","leave-from-class":"opacity-100","leave-to-class":"opacity-0"},{default:r(()=>[f(s("div",{class:"fixed inset-0 transform transition-all",onClick:u},e[0]||(e[0]=[s("div",{class:"absolute inset-0 bg-gray-500 opacity-75"},null,-1)]),512),[[y,l.show]])]),_:1}),a(p,{"enter-active-class":"ease-out duration-300","enter-from-class":"opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95","enter-to-class":"opacity-100 translate-y-0 sm:scale-100","leave-active-class":"ease-in duration-200","leave-from-class":"opacity-100 translate-y-0 sm:scale-100","leave-to-class":"opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"},{default:r(()=>[f(s("div",{class:h(["mb-6 transform overflow-hidden rounded-lg bg-white shadow-xl transition-all sm:mx-auto sm:w-full",d.value])},[l.show?b(m.$slots,"default",{key:0}):S("",!0)],2),[[y,l.show]])]),_:3})],512),[[y,l.show]])]),_:3})]))}},W=["type"],F={__name:"SecondaryButton",props:{type:{type:String,default:"button"}},setup(l){return(n,o)=>(x(),_("button",{type:l.type,class:"inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-xs font-semibold uppercase tracking-widest text-gray-700 shadow-sm transition duration-150 ease-in-out hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-25"},[b(n.$slots,"default")],8,W))}},I={class:"space-y-6"},K={class:"p-6"},L={class:"mt-6"},j={class:"mt-6 flex justify-end"},R={__name:"DeleteUserForm",setup(l){const n=v(!1),o=v(null),t=U({password:""}),u=()=>{n.value=!0,A(()=>o.value.focus())},i=()=>{t.delete(route("profile.destroy"),{preserveScroll:!0,onSuccess:()=>d(),onError:()=>o.value.focus(),onFinish:()=>t.reset()})},d=()=>{n.value=!1,t.clearErrors(),t.reset()};return(m,e)=>(x(),_("section",I,[e[6]||(e[6]=s("header",null,[s("h2",{class:"text-lg font-medium text-gray-900"}," Delete Account "),s("p",{class:"mt-1 text-sm text-gray-600"}," Once your account is deleted, all of its resources and data will be permanently deleted. Before deleting your account, please download any data or information that you wish to retain. ")],-1)),a(g,{onClick:u},{default:r(()=>e[1]||(e[1]=[w("Delete Account")])),_:1}),a(P,{show:n.value,onClose:d},{default:r(()=>[s("div",K,[e[4]||(e[4]=s("h2",{class:"text-lg font-medium text-gray-900"}," Are you sure you want to delete your account? ",-1)),e[5]||(e[5]=s("p",{class:"mt-1 text-sm text-gray-600"}," Once your account is deleted, all of its resources and data will be permanently deleted. Please enter your password to confirm you would like to permanently delete your account. ",-1)),s("div",L,[a(M,{for:"password",value:"Password",class:"sr-only"}),a(N,{id:"password",ref_key:"passwordInput",ref:o,modelValue:c(t).password,"onUpdate:modelValue":e[0]||(e[0]=k=>c(t).password=k),type:"password",class:"mt-1 block w-3/4",placeholder:"Password",onKeyup:T(i,["enter"])},null,8,["modelValue"]),a(z,{message:c(t).errors.password,class:"mt-2"},null,8,["message"])]),s("div",j,[a(F,{onClick:d},{default:r(()=>e[2]||(e[2]=[w(" Cancel ")])),_:1}),a(g,{class:h(["ms-3",{"opacity-25":c(t).processing}]),disabled:c(t).processing,onClick:i},{default:r(()=>e[3]||(e[3]=[w(" Delete Account ")])),_:1},8,["class","disabled"])])])]),_:1},8,["show"])]))}};export{R as default};
