from .Command import Command
from Config import getCommandName, getSetting
from Util import parseSearchQuery, parsePlaylists


class MyPlaylist(Command):
    def __init__(self, spotify):
        super().__init__(getCommandName("PLAY_MY_PLAYLIST_COMMAND"), spotify)

    def Match(self, query: str):
        query, page = parseSearchQuery(query)
        playlistOffset = int(getSetting("MAX_RESULTS")) * (page - 1)
        playlists = self.spotify.current_user_playlists(
            limit=int(getSetting("MAX_RESULTS")), offset=playlistOffset)
        return parsePlaylists(playlists)

    def Run(self, data: str):
        raise NotImplementedError
