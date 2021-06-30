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
		<div class="flex p-4 space-x-16 justify-around">
			<div class="mb-4">
				<div class="bg-gray-300 w-80 h-80">
					<!-- ここにダミーのカレンダーを貼り付ける -->
					<p>カレンダー</p>
				</div>
			</div>
			<div class="">
				<p class="font-bold text-xl mb-4">2021.06.30の日報</p>
				<div>
					<p class="text-sm mb-8">日報はありません</p>
					<form class="border p-4 shadow-md text-center" action="task"
						method="post">
						<input type="hidden" name="isNew" value="true"> <label
							class="inline-block">タスクの内容<br> <textarea
								name="task-content" class="border p-4 m-2" cols="50" rows="2"></textarea>
						</label><br> <label class="inline-block p-2">期日: <input
							class="border px-2 py-1 w-16 ml-4 mr-2" type="number"
							name="month" max="12" min="1">月 <input
							class="border px-2 py-1 w-16 mx-2" type="number" name="day"
							max="31" min="1">日
						</label><br> <label class="inline-block p-2 mb-4">担当者: <input
							class="border px-2 py-1 ml-4" type="text" name="assignee">
						</label><br> <input
							class="py-2 w-72 rounded-sm font-bold text-white bg-yellow-500 hover:bg-yellow-400 cursor-pointer"
							type="button" value="＋ タスクを作成する">
					</form>
				</div>
			</div>
		</div>
		<div class="p-4">
			<h2 class="text-2xl font-bold mt-8 mb-2">本日のタスク</h2>
			<p>本日のタスクはありません</p>
			<h2 class="text-2xl font-bold mt-8 mb-2">未完了のタスク</h2>
			<p>タスクは未設定です</p>
			<form>
				<div class="text-center space-x-8">
					<input
						class="text-xl py-2 w-56 rounded-sm bg-blue-400 text-white font-bold"
						type="button" value="編集"> <input
						class="text-xl py-2 w-56 rounded-sm bg-red-400 text-white font-bold"
						type="button" value="削除">
				</div>
				<table class="table-auto mt-4">
					<tr class="whitespace-nowrap border">
						<th class="p-2">操作</th>
						<th class="p-2">担当者</th>
						<th class="p-2">期日</th>
						<th class="p-2">タスクの内容</th>
					</tr>
					<tr class="border">
						<td class="p-2 text-center align-middle"><input
							class="scale-150" type="radio""></td>
						<td class="p-2">Aさん</td>
						<td class="p-2">2021/07/01</td>
						<td class="p-2">ずっと後回しにしていたかなり難易度の高い作業を３日後までに５０％の完了状態にまでなんとか仕上げられるようにしたい</td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<footer
		class="relative mt-8 w-full bottom-0 p-2 bg-blue-800 text-center font-mono text-sm text-white">
		<p>JPIN Exercise at 2021/07</p>
	</footer>

</body>
</html>