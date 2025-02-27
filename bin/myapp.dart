import 'package:myapp/myapp.dart' as myapp;


void main() {
  List<Map<String, dynamic>> library = [];
  
  
  AddBook(library, Title: "Dart", year: 2021, Author: "Alice", genre: "Programming");
  AddBook(library, Title: "Flutter", year: 2022, genre: "Mobile");
  AddBook(library, Title: "Dart", Author: "Charlie", genre: "Programming");
  

  print("\nGetting info for 'Dart':");
  print(GetBookInformation(library, Title: "Dart"));
  
  print("\nGetting info for 'notreal':");
  print(GetBookInformation(library, Title: "not real")); 
  

  print("\nListing all books:");
  ListAllBooks(library);
  
  print("\nListing all books in 'Programming' genre:");
  ListAllBooks(library, genre: "Programming");
  
  print("\nListing books by genre 'Mobile':");
  ListBooksByGenre(library, genre: "Mobile");
  
  print("\nRemoving book 'Flutter Essentials':");
  RemoveBook(library, Title: "Flutter Essentials"); 
  

  print("\nRemoving book 'Nonexistent Book':");
  RemoveBook(library, Title: "Nonexistent Book"); 
  print("\nListing all books after removals:");
  ListAllBooks(library);
}


void AddBook(List <Map<String, dynamic>> Books,
{
  required String Title, 
  int year = -9999,
  String Author = "unknown",
  String genre = "unknown",}) {
  print('added book: $Title, year: $year, Author: $Author, genre: $genre');
  Map <String,dynamic> Book ={
"Title": Title,
"year": year,
"Author": Author,
"genre": genre,

  };
  Books.add(Book);
  print("book $Title added succufully");
}


String GetBookInformation(List <Map<String, dynamic>> Books, {required String Title}) {
  String info = "book not found";
  Books.forEach((Book) {(Book["Title"] == Title);
  info = "Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}";});
  return info;
}

void ListAllBooks(List <Map<String, dynamic>> Books, {String genre = "none"}){
  if (genre == "none"){
  Books.forEach((Book){
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}");
  });
  return;
  }
  else{
    print("for the gerne $genre:");
    Books.forEach((Book){ (Book["genre"]==genre); 
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}");
  });
  }

}


void ListBooksByGenre(List <Map<String, dynamic>> Books, {required String genre}){
  var BooksByGenre = Books.where((book) => book["genre"]== genre);
  if (BooksByGenre.isEmpty) {print("no books found for this genre found"); return;}
  BooksByGenre.forEach((Book) {print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}");;
  });

}
 
void RemoveBook(List <Map<String, dynamic>> Books,  {required String Title}){
  int initialLength = Books.length;
  Books.removeWhere((Book) => Book["Title"] == Title);
  if (Books.length < initialLength) {
    print("Book removed successfully.");
  } else {
    print("Book not found.");
  }
}
/*
List <Map<String, dynamic>> GetBookInformation(List <Map<String, dynamic>> Books, String Title) {
  List <Map<String, dynamic>> BooksWithTheTitle = Books.where((Book) => Book["Title"]==Title).toList(); 
  return(BooksWithTheTitle);
}*/
/*
void RemoveBook(String Title){
  for (var Book in Library){
    if (Book["Title"]==Title){
    Library.remove(Book);
    print("removed Book");
    return ;
    }
  }
  print("Book not found");
}*/

/*
void ListAllBooks(){
  for (var Book in Library){
    print("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}");
  }
}*/
/*String GetBookInformation(String Title){

  for (var Book in Library){
    if (Book["Title"] == Title) {
      return ("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}");
      }
  }
  return ("not found");
}
String GetBookInformation(String Title){

  for (var Book in Library){
    if (Book["Title"] == Title) {
      return ("Title: ${Book["Title"]}, Author: ${Book["Author"]}, year: ${Book["year"]}, genre: ${Book["genre"]}");
      }
  }
  return ("not found");
}*/

