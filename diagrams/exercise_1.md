# Creating a sequence diagram for a database-backed program

In this section, you will step away from the code for a bit and learn how to build sequence diagrams to communicate what how your program is working.

Why should you bother with this? 

As you've probably noticed, the number of files in your codebase has grown considerably compared to codebases you were working with in previous exercises. In real applications, codebases can easily contain hundreds or even thousands of files. No one can hold all that information in their head at once.

 * A diagram is easier to digest, present and discuss than a whole program made of written code. It is also easier to modify if it's needed.
 * It will force you to think deeper about what is happening in your program, and to explain to yourself (and your peers) how the different components of the app is working. This will become very useful when it comes to debugging too.

**A sequence diagram** for a database-backed program helps us to explain and communicate two important things:
 * The interaction between the different components of the program and the database
 * The order in which the different parts interact together


## Exercise

The diagram presented above presents what happens in database-backed program at a high level. We can "zoom in" as needed, to illustrate more low level details. Here is a template of a more detailed sequence diagram for the program that prints out albums that you wrote in the [previous step](./02_test_driving_model_repository_classes.md#exercise).
However, some important information has been left out.

Using the codebase for that exercise, fill in the gaps in this diagram.

```mermaid
sequenceDiagram
    participant t as terminal
    participant app as Main program (in app.rb)
    participant ar as MusicLibraryRepository class <br /> (in lib/music_library_repository.rb)
    participant db_conn as DatabaseConnection class in (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database by calling connect method on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls all method on MusicLibraryRepository
    ar->>db_conn: Sends SQL query by calling exec_params method on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the albums table

    db_conn->>ar: Returns an array of hashes, one for each row of the albums table
    loop 
        ar->>ar: Loops through array and creates a album object for every row
    end
    ar->>app: Returns array of album objects
    app->>t: Prints list of albums to terminal
```

<details>
    <summary><b>Solution</b></summary>

<!-- OMITTED -->

> If the diagram doesn't render well inside this box, click the "<->" button in top right corner to expand it.

```mermaid
sequenceDiagram
    participant t as terminal
    participant app as Main program (app.rb)
    participant ar as AlbumRepository class <br /> (in lib/album_repository.rb)
    participant db_conn as DatabaseConnection class <br /> (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database calling method `connect` on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls method `all` on AlbumRepository
    ar->>db_conn: Sends SQL query by calling method `exec_params` on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the albums table

    db_conn->>ar: Returns an array of hashes, one for each row of the albums table
    loop 
        ar->>ar: Loops through array and creates an Album object for every row
    end
    ar->>app: Returns array of Album objects
    app->>t: Prints list of albums to terminal
```
