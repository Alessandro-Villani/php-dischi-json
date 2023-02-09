console.log('VUE OK', Vue);

const apiUri = 'http://localhost/php-dischi-json/api.php';

const app = Vue.createApp({
data(){
    return {
        disks: []
    }
},
methods: {
    getDisks(){
        axios.get(apiUri).then(res => {
            this.disks = res.data;
        })
    }
},
mounted(){
    this.getDisks();
}
});

app.mount('#root');