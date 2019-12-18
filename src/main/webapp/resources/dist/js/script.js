new Vue({
  el: '#app',
  data () {
    return { 
        myStar: false,
        // nav part
        nowNav: 0,
        navLists: [{
          txt: 'Add Project',
          status: 'all'
        },{
          txt: 'In Progress',
          status: false
        },{
          txt: 'Completed',
          status: true
        }],
        // toogle add list section
        showAddList: false,
        showInputTop: true,
        // edit list
        nowClickNum: -1,
        
        nowList: {
          todoTitle: '',
          tTime: '',
          fileList: '',
          comment: ''
        },
        filterLists: [],
        todoLists: [{
          todoTitle: 'Go Shopping',
          tTime: '2018-06-06T16:00:00.000Z',
          fileList: '',
          comment: 'hannah',
          status: false,
          myStar: false
        },{
          todoTitle: 'Finish hex to do list',
          tTime: '',
          fileList: '',
          comment: 'hahaha',
          status: false,
          myStar: false,
          fileTime: ''
        }],
    }
  },
  mounted () {
    this.filterLists = this.todoLists;
  },
  methods: {
    myDate(date){
      return (new Date(date).getMonth() + 1) + '/' + new Date(date).getDate();
    },
    isStar(index){
      this.todoLists[index].myStar = !this.todoLists[index].myStar;
    },
    //  Add Task ----------
    goAddTask(title = '', deadline = '', fileList = [], comment= '') {
      
      // todoLists.push
      this.todoLists.push({
         todoTitle: title,
          tTime: deadline,
          fileList: fileList,
          comment: comment,
          status: false,
          myStar: false
      });
      
      this.showAddList = false;
      //reset
      this.resetInput();

    },
    resetInput () {
       this.nowList =  {
          todoTitle: '',
          tTime: '',
          fileList: [],
          comment: ''
        }
    },
    // upload
    handleChange(index) {
      
      if(index != undefined){
        console.log(this.$refs['fileInput'+index])
        this.todoLists[index].fileList = this.$refs['fileInput'+index][0].files[0].name;
      }else{
        this.nowList.fileList = this.$refs.fileInput.files[0].name;
      }
      
    },
    //cancel
    goCancel(index){
      if(index){
        // sub list
        this.nowClickNum = -1
      }else{
        // main add list
        this.showAddList = false;
      }
      this.resetInput();
      
    },
    // Edit
    goEdit (index, title = '', deadline = '', fileList = [], comment= '') {
        this.todoLists[index].todoTitle = title;
        this.todoLists[index].tTime = deadline;
        this.todoLists[index].fileList = fileList;
        this.todoLists[index].comment = comment;
       console.log('title:  ', title)
      console.log(index, this.todoLists)
      this.nowClickNum = -1;
      //reset
      this.resetInput();
    },
    // Filter Nav
    navFilter(index, navStatus){
      // actice tab nav
      this.nowNav = index;
      this.showAddList = false;
      // filter
      if(navStatus != 'all'){
        this.showInputTop = false;
        this.filterLists =  this.todoLists.filter(function(item){
            return item.status == navStatus;
        })
      }else{
        this.showInputTop = true;
        this.filterLists =  this.todoLists
      }
      
      
    }
  }
})