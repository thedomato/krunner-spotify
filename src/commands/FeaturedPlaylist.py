from .Command import Command
from Config import getCommandName, getSetting
from Util import parseSearchQuery, parsePlaylists


class FeaturedPlaylist(Command):
    def __init__(self, spotify):
        super().__init__(getCommandName("PLAY_FEATURED_PLAYLIST_COMMAND"), spotify)

    def Match(self, query: str):
        return [("", "Featured playlists unavailable: Spotify removed this API endpoint. Use 'sp play myplaylist' to browse your own playlists.", "Spotify", 100, 100, {})]

    def Run(self, data: str):
        raise NotImplementedError
