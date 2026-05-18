from .Command import Command
from Config import getCommandName, getSetting
from Util import parseSearchQuery, parsePlaylists


class Playlist(Command):
    def __init__(self, spotify):
        super().__init__(getCommandName("PLAY_PLAYLIST_COMMAND"), spotify)

    def Match(self, query: str):
        searchResults = []
        if(query != ""):
            query, page = parseSearchQuery(query)
            playlistOffset = int(getSetting("MAX_RESULTS")) * (page - 1)
            searchResults = self.spotify.search(
                query, int(getSetting("MAX_RESULTS")), playlistOffset, "playlist")
            return parsePlaylists(searchResults["playlists"])
        return [("", "Enter a playlist name to search", "Spotify", 100, 100, {})]

    def Run(self, data: str):
        raise NotImplementedError
