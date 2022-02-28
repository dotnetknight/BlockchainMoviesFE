// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Movies {
    struct MoviesStructure {
        uint256 Id;
        string Name;
        string Director;
        uint256 ReleaseDate;
    }

    MoviesStructure[] MoviesArray;

    function AddMovie(
        uint256 _Id,
        string memory _Name,
        string memory _Director,
        uint256 _ReleaseDate
    ) public {
        MoviesArray.push(MoviesStructure(_Id, _Name, _Director, _ReleaseDate));
    }

    function GetMovies() public view returns (MoviesStructure[] memory) {
        return MoviesArray;
    }
}
