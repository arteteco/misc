#!/usr/bin/env python

import bencode
import sys
try:
	from urlparse import urlparse # Python 2
except ImportError:
	from urllib.parse import urlparse # Python 3

if len(sys.argv) < 2:
	print("Usage: %s tracker-list-file torrent..." % sys.argv[0])
	sys.exit(1)

trackers = []
with open(sys.argv[1]) as f:
	for line in f:
		line = line.strip()
		if line == "": # Line is empty
			continue
		if not line.startswith('##'): ## for inserting; normally invalid
			if line.startswith('#'): # Comment
				continue
		else:
			line = line[1:] # Remove inital #
		r = urlparse(line)
		trackers.append(line)
		if r.netloc == "":
			sys.stderr.write("No host specefied: %s\n" % (line,))
		if r.scheme not in ["http", "udp"]:
			sys.stderr.write("Unknown scheme \"%s\": %s\n" % (r.scheme, line))

# An array that stores like how the file stores them...
trackers_torrent = [[tracker] for tracker in trackers]

for tfilename in sys.argv[2:]:
	with open(tfilename) as f:
		data = bencode.bdecode(f.read())
	data["announce"] = trackers[0]
	data["announce-list"] = trackers_torrent
	with open(tfilename, "w") as f:
		f.write(bencode.bencode(data))
