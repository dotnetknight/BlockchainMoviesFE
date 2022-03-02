// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Movies {
    struct MoviesStructure {
        uint256 Id;
        string Name;
        string Director;
        ActorsStruct[] Actors;
    }

    struct ActorsStruct {
        uint256 Id;
        string Name;
    }

    struct MovieIdStruct {
        uint256 movieId;
    }

    struct ActorIdStruct {
        uint256 actorId;
    }

    MovieIdStruct movieCounter;
    ActorIdStruct actorCounter;
    MoviesStructure[] MoviesArray;
    mapping(uint256 => MoviesStructure) public mapMovie;

    function NextMovieId(MovieIdStruct storage _counter)
        internal
        returns (uint256)
    {
        _counter.movieId = _counter.movieId + 1;
        return _counter.movieId;
    }

    function NextActorId(ActorIdStruct storage _counter)
        internal
        returns (uint256)
    {
        _counter.actorId = _counter.actorId + 1;
        return _counter.actorId;
    }

    function AddMovie(MoviesStructure memory _movie) public {
        uint256 _movieId = NextMovieId(movieCounter);

        MoviesStructure storage movie = mapMovie[_movieId];
        movie.Id = _movieId;
        movie.Director = _movie.Director;
        movie.Name = _movie.Name;

        for (uint256 i = 0; i < _movie.Actors.length; i++) {
            movie.Actors.push(
                ActorsStruct(NextActorId(actorCounter), _movie.Actors[i].Name)
            );
        }

        MoviesArray.push(movie);
    }

    function GetMovies() public view returns (MoviesStructure[] memory) {
        return MoviesArray;
    }
}
