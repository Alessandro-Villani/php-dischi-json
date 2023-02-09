console.log('VUE OK', Vue);

const apiUri = 'http://localhost/php-dischi-json/api.php';

const app = Vue.createApp({
data(){
    return {
        disks: [],
        isLoading: false,
        showInfo: false,
        currentIndex: undefined,
        genres: [],
        selectedGenre: ''
    }
},
methods: {
    getDisks(){
        this.isLoading = true;
        let params = {}
        if(this.selectedGenre){
            console.log('inside');
            params = {
                genre: this.selectedGenre
            }
        }
        console.log('params');
        console.log(params);
        axios.get(apiUri, {params}).then(res => {
            console.log(res.data);
            this.disks = res.data;
            if(!this.selectedGenre) this.getGenres();
        }).catch(e => console.log(e)).then(() => {
            this.isLoading = false;
        })
    },
    getGenres(){
        this.disks.forEach(disk => {
            if(!this.genres.includes(disk.genre)) this.genres.push(disk.genre);
        });
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