console.log('VUE OK', Vue);

const apiUri = 'http://localhost/php-dischi-json/api.php';

const app = Vue.createApp({
data(){
    return {
        disks: [],
        isLoading: false,
        showInfo: false,
        currentIndex: undefined
    }
},
methods: {
    getDisks(){
        this.isLoading = true;
        console.log(this.isLoading);
        axios.get(apiUri).then(res => {
            this.disks = res.data;
        }).catch(e => console.log(e)).then(() => {
            this.isLoading = false;
        })
    },
    showDiskInfo(i){
        this.currentIndex = i;
        this.showInfo = true;
    },
    closeInfo(){
        this.showInfo = false;
    }
},
mounted(){
    this.getDisks();
}
});

app.mount('#root');