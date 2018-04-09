import json
import os

def _load_json(filename):
    with open(filename) as f:
        return json.load(f)


def _write_json(filename, data):
    with open(filename, 'w+') as f:
        json.dump(data, f)


def setup_vcs_settings(filename, gist):
    data = _load_json(filename)
    data['sync.gist'] = gist
    _write_json(filename, data)


def setup_vcs_settings_sync(filename, git_token):
    data = _load_json(filename)
    data['token'] = git_token
    _write_json(filename, data)

