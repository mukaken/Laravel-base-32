<?php

class Markdown_Task extends Task
{

	public function run($param)
	{
		if ( count($param) < 2 ) {
			echo 'Please specify input file and output file.'.PHP_EOL.
			'Specified '.count($param).' parameter(s).'.PHP_EOL;
			exit(1);
		}

		$inputfile = $param[0];
		$outputfile = $param[1];

		if ( !File::exists($inputfile) ) {
			echo 'No file found.'.PHP_EOL;
			exit(2);
		}

		$content = File::get($inputfile, '');

		require_once path('bundle').'/docs/libraries/markdown.php';

		$output =
			'<html>'.
			'<title></title>'.
			'<body>'.Markdown($content).'</body>';

		if ( File::put($outputfile, $output) === false ) {
			echo "Failed output content to $outputfile.".PHP_EOL;
			exit(3);
		}

		exit(0);
	}

}
