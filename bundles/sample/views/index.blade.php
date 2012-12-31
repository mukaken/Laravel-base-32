<html>
	<head>
		<title>サンプルバンドル</title>
	</head>
	<body>
		<table>
			<tr>
				<th>キー</th>
				<th>内容</th>
			</tr>
			@foreach ( $content as $key => $val )
			<tr>
				<td>{{ $key }}</td>
				<td>{{ $val }}</td>
			</tr>
			@endforeach
		</table>
	</body>
</html>