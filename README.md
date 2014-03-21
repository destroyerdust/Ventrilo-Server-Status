Ventrilo Server Status
======================

Ventrilo Server Status is basically a webscraper that scrapes the default ventrilo server status website (http://www.ventrilo.com/status.php) and it will collect information about a ventrilo server and return in a array. (Soon to be JSON)

Installation
============

The following will build the gem to be used:

	gem build ./vent_status.gemspec

Then the following will install the gem to be used:

	gem install ./vent_status-0.0.1.gem

If installation fails please check version number (0.0.1 on the .gem file) and update accordingly.

Usage
=====

First you have to install the gem so look above!

Now you can use the gem. Listed before is the simple usage of the gem.

	require 'vent_status'

	# Returns all information (Server and Players for now)
	Vent_Status.full_status('<hostname>', '<port>')

	# Returns Server Information
	Vent_Status.server('<hostname>', '<port>')

	# Returns Player Information
	Vent_Status.players('<hostname>', '<port>')

Example:

	require 'vent_status'

	# Returns all information (Server and Players for now)
	Vent_Status.full_status('notarealvent.typefrag.com', '55555')

	# Returns Server Information
	Vent_Status.server('notarealvent.typefrag.com', '55555')

	# Returns Player Information
	Vent_Status.players('notarealvent.typefrag.com', '55555')

License
=======

See LICENSE for more information