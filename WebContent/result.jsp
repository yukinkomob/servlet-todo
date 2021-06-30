<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nishimura - 自己紹介 -</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<header
		class="p-4 bg-blue-400 text-center font-mono text-3xl text-white font-bold shadow-md">
		<p>ToDo App</p>
	</header>
	<main class="m-3 border-gray-200 border shadow-md">
		<div class="p-4">
			<h1 class="text-blue-500 text-2xl font-bold">◆ メインメニュー</h1>
		</div>
		<hr class="p-0 w-full mb-6">
		<div class="flex p-4 space-x-16">
			<div class="mb-4">
				<div class="bg-gray-300 w-80 h-80">
					<!-- ここにダミーのカレンダーを貼り付ける -->
					<p>カレンダー</p>
				</div>
				<h2 class="text-2xl font-bold mt-8 mb-2">本日のタスク</h2>
				<p>本日のタスクはありません</p>
				<h2 class="text-2xl font-bold mt-8 mb-2">一週間後までのタスク</h2>
				<p>タスクは未設定です</p>
				<form>
					<input
						class="py-2 w-72 rounded-sm font-bold text-white bg-yellow-600"
						type="button" value="＋ タスクを作成する">
				</form>
			</div>
			<div class="">
				<p class="font-bold text-xl mb-4">2021.06.30の日報</p>
				<div>
					<p class="text-sm mb-4">日報はありません</p>
					<form>
						<input
							class="py-2 w-72 rounded-sm font-bold text-white bg-yellow-500"
							type="button" value="＋ 日報を作成する">
					</form>
				</div>
			</div>
		</div>
	</main>
	<footer
		class="absolute w-full bottom-0 p-2 bg-blue-800 text-center font-mono text-sm text-white">
		<p>JPIN Exercise at 2021/07</p>
	</footer>

</body>
</html>