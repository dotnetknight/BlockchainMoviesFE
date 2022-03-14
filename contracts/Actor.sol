// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Actor {
    // ["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0", "Christian Bale", [["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0","The Dark Knight"], ["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0","The Dark Knight Rises"]], ["0xA27eEfe6b5180F085CE6Aa5D6DaA81d1c35153C0", "Hans  Zimmer"]]

    struct ActorStruct {
        string token;
        string name;
        MovieStruct[] movies;
        ComposerStruct composer;
    }

    struct MovieStruct {
        string token;
        string name;
    }

    struct ComposerStruct {
        string token;
        string name;
    }

    ActorStruct[] Actors;
    mapping(string => ActorStruct) internal mapActor;

    function getActors() public view returns (ActorStruct[] memory) {
        return Actors;
    }

    function getActorByToken(string memory token)
        public
        view
        returns (ActorStruct memory)
    {
        ActorStruct storage actor = mapActor[token];
        return actor;
    }

    function addActor(ActorStruct memory actorToAdd) public returns (bool) {
        if (actorExists(actorToAdd.token)) {
            revert();
        }

        ActorStruct storage actor = mapActor[actorToAdd.token];
        actor.name = actorToAdd.name;
        actor.token = actorToAdd.token;

        for (uint256 i = 0; i < actorToAdd.movies.length; i++) {
            actor.movies.push(
                MovieStruct(actorToAdd.token, actorToAdd.movies[i].name)
            );
        }

        actor.composer = actorToAdd.composer;

        Actors.push(actor);

        return true;
    }

    function actorExists(string memory token) private view returns (bool) {
        ActorStruct memory testStruct = getActorByToken(token);

        return
            keccak256(abi.encodePacked(testStruct.token)) ==
            keccak256(abi.encodePacked(token));
    }
}
