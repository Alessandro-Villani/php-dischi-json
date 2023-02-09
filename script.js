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

    //Function to get disks
    getDisks(){
        this.isLoading = true;
        let params = {}
        if(this.selectedGenre){
            params = {
                genre: this.selectedGenre
            }
        }
        axios.get(apiUri, {params}).then(res => {
            this.disks = res.data;
            if(!this.selectedGenre) this.getGenres();
        }).catch(e => console.log(e)).then(() => {
            this.isLoading = false;
        })
    },

    //Function to get genres from API disks
    getGenres(){
        this.disks.forEach(disk => {
            if(!this.genres.includes(disk.genre)) this.genres.push(disk.genre);
        });
    },

    //Function for showing Disk Info on card click
    showDiskInfo(i){
        this.currentIndex = i;
        this.showInfo = true;
    },

    //Function for closing Disk Info
    closeInfo(){
        this.showInfo = false;
    }
},
mounted(){
    
    //API call to get all disks in DB
    this.getDisks();
}
});

app.mount('#root');