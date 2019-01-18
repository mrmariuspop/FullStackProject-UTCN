function BooksCtrl($state, books,Books,Reviews, Session) {
    var vm = this;
    vm.deleteBook1 = deleteBook1;
    vm.editBook1=editBook1;
    vm.setBook=setBook;
    vm.createBook1=createBook1;
    vm.deleteReview1=deleteReview1;
    vm.getReviews1=getReviews1;
    vm.logout = logout;

    vm.reviews={};
    vm.book={};
    vm.bookCreate={};
    vm.books = books;
    vm.badCredentials = false;

    function setBook(username){
        Books.findBook(username)
            .then(function(response){
                console.log(response);
                vm.badCredentials = false;
                vm.book = response;
            })
    }

    function deleteBook1(idbook){
        Books.deleteBook(idbook)
            .then(function(response){
                console.log(response);
                $state.go("booksPage", {}, {reload: true});
            })
    }

    function editBook1(){
        Books.editBook(vm.book)
            .then(function(response){
                console.log(response);
                vm.book={};
                angular.element( document.querySelector( '#myModalEdit' )).removeClass('in');
                $state.go("booksPage", {}, {reload: true});

            })
            .catch(function () {
                vm.badCredentials = true;
            });
    }
    function createBook1(){
        Books.createBook(vm.bookCreate)
            .then(function(response){
                console.log(response);
                angular.element( document.querySelector( '#myModalCreate' )).removeClass('in');
                $state.go("booksPage", {}, {reload: true});

            })
            .catch(function () {
                vm.badCredentials = true;
            });
    }

    function deleteReview1(idreview){
        Reviews.deleteReview(idreview)
            .then(function(response){
                Reviews.getReviews(vm.book.bookid)
                    .then(function(response){
                        vm.reviews=response;

                    })
            })
    }

    function getReviews1(bookid){
        Books.findBook(bookid)
            .then(function(response){
                vm.book = response;
                Reviews.getReviews(vm.book.bookid)
                    .then(function(response){
                        vm.reviews=response;
                    })
            })

    }
    function logout(){
        Session.destroy();
            $state.go("login", {}, {reload: true});


    }




}

angular
    .module("app")
    .controller("BooksCtrl", BooksCtrl);