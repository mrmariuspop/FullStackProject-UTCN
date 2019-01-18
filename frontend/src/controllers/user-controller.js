function UserCtrl($state, books,Books,Admin,Reviews,Order,Session) {
    var vm = this;
    vm.books = books;
    vm.getReviews1 = getReviews1;
    vm.createReview1 = createReview1;
    vm.isGoodQuantity = isGoodQuantity;
    vm.setBook = setBook;
    vm.badCredentials = false;
    vm.bookAdded=false;
    vm.review = {};
    vm.currentBook = {};
    vm.logout = logout;
    vm.setRate = setRate;
    vm.createOrder1 = createOrder1;
    vm.addBookToOrder = addBookToOrder;
    vm.deleteBook1 = deleteBook1;
    vm.newOrder={};
    vm.orderBook = [];
    vm.orderSent=false;


    function deleteBook1(bookid) {
        vm.bookAdded=false;
    angular.forEach(vm.orderBook, function (delBook, index) {
        if (delBook.bookid==bookid){
            vm.orderBook.splice(index, 1);
        }
    })
    }

    function addBookToOrder(book){
        angular.forEach(vm.orderBook, function (delBook, index) {
            if (delBook.bookid==book.bookid){
                vm.orderBook.splice(index, 1);
            }
        })
        vm.orderBook.push(book);
        Session.setData(vm.orderBook);
        vm.bookAdded=true;
    }

    function createOrder1(){
        var obj1={};
        vm.bookAdded=false;
        if(vm.orderBook.length>0){
            obj1.username=Session.getUsername();
            obj1.order=vm.newOrder;
            obj1.books=vm.orderBook;
            console.log(obj1);
            Order.createOrder(obj1)
                .then(function(response){
                    console.log(response);
                    vm.succesMesaage=response.message;
                    vm.orderSent=true;
                    Session.destroyData();
                    angular.element( document.querySelector( '#myModalOrder' )).removeClass('in');
                   /* $state.go("userPage", {}, {reload: true});*/
                })
        } else{
            vm.badCredentials = true;
        }


    }


    function getReviews1(bookid){
        vm.bookAdded=false;
        vm.orderSent=false;
        Books.findBook(bookid)
            .then(function(response){
                vm.currentBook = response;
                Reviews.getReviews(vm.currentBook.bookid)
                    .then(function(response){
                        vm.reviews=response;
                    })
            })

    }

    function setBook(bookid){
        vm.orderSent=false;
        vm.bookAdded=false;
        Books.findBook(bookid)
            .then(function(response){
                console.log(response);
                vm.currentBook = response;
            })
    }
    function setRate(){
        vm.orderSent=false;
        vm.bookAdded=false;
        Books.rateBook( vm.currentBook.bookid,vm.rate)
            .then(function(response){
                Books.findBook(vm.currentBook.bookid)
                    .then(function(response){
                        console.log(response);
                        vm.currentBook = response;
                        angular.element( document.querySelector( '#myModalRate' )).removeClass('in');
                        $state.go("userPage", {}, {reload: true});
                    })
            })
    }


    function createReview1(){
        vm.orderSent=false;
        vm.bookAdded=false;
        vm.review.user=Session.getUsername();
        vm.review.book=vm.currentBook;

                Reviews.createReview(vm.review)
                    .then(function(response){
                        vm.badCredentials = false;
                        console.log(response);
                                Reviews.getReviews(vm.currentBook.bookid)
                                    .then(function(response){
                                        vm.reviews=response;
                                        vm.review.review=null;

                                    })


                    })
                    .catch(function () {
                        vm.badCredentials = true;
                    })

    }
    function isGoodQuantity(q){
        if(q>0  ){
            return true;
        }else{
            return false;
        }
    }
    function logout(){
        Session.destroy();
        $state.go("login", {}, {reload: true});


    }
}

angular
    .module("app")
    .controller("UserCtrl", UserCtrl);
