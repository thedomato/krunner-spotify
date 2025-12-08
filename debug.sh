mkdir -p ~/.local/share/kservices5/
cp plasma-runner-KRunnerSpotify.desktop ~/.local/share/kservices5/
kquitapp6 krunner
pkill python3
python3 src/KRunnerSpotify.py