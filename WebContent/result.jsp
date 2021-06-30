<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo管理</title>
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
	<main class="m-3 border-gray-200 border shadow-md min-h-screen">
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
				<p class="font-bold text-xl mb-4">2021.06.30</p>
				<div>
					<form class="border p-4 shadow-md text-center" action="task"
						method="post">
						<input type="hidden" name="isNew" value="true"> <label
							class="inline-block">タスクの内容<br> <textarea
								name="task_content" class="border p-4 m-2" cols="50" rows="2"></textarea>
						</label><br> <label class="inline-block p-2">期日: <input
							class="border px-2 py-1 w-16 ml-4 mr-2" type="number"
							name="month" max="12" min="1">月 <input
							class="border px-2 py-1 w-16 mx-2" type="number" name="day"
							max="31" min="1">日
						</label><br> <label class="inline-block p-2 mb-4">担当者: <input
							class="border px-2 py-1 ml-4" type="text" name="assignee">
						</label><br> <input
							class="py-2 w-72 rounded-sm font-bold text-white bg-yellow-500 hover:bg-yellow-400 cursor-pointer"
							type="submit" value="＋ タスクを作成する">
					</form>
				</div>
			</div>
		</div>
		
		<hr class="my-16">
		
		<div class="p-4">

			<c:choose>
				<c:when test="${ fn:length( sessionScope.list ) <= 0 }">
					<p>タスクは未設定です</p>
				</c:when>

				<c:otherwise>

					<form action="task" method="post">
						<div class="flex justify-around">
							<div>
								<h2 class="text-2xl font-bold mt-8 mb-2">未完了のタスク</h2>

								<table class="table-auto mt-4">
									<tr class="whitespace-nowrap border">
										<th class="p-2">操作</th>
										<th class="p-2">担当者</th>
										<th class="p-2">期日</th>
										<th class="p-2">タスクの内容</th>
									</tr>

									<c:forEach items="${ sessionScope.list }" var="task"
										varStatus="status">

										<tr class="border">
											<td class="p-2 text-center align-middle"><input
												class="scale-150" type="radio" name="index"
												value="${ task.id }"></td>
											<td class="p-2"><c:out value="${ task.assignee }" /></td>
											<td class="p-2">2021/<c:out value="${ task.month }" />/<c:out
													value="${ task.day }" /></td>
											<td class="p-2"><c:out value="${ task.taskContent }" /></td>
										</tr>

									</c:forEach>

								</table>
							</div>

							<div class="text-center">
								<div class="p-4 border">
									<h1 class="p-4 text-2xl">タスク情報の更新</h1>
									<label class="inline-block">タスクの内容<br /> <textarea
											name="task_content" class="border p-4 m-2" cols="50" rows="2"></textarea></label><br />
									<label class="inline-block p-2">期日: <input
										class="border px-2 py-1 w-16 ml-4 mr-2" type="number"
										name="month" max="12" min="1" />月 <input
										class="border px-2 py-1 w-16 mx-2" type="number" name="day"
										max="31" min="1" />日
									</label><br /> <label class="inline-block p-2 mb-4">担当者: <input
										class="border px-2 py-1 ml-4" type="text" name="assignee" />
									</label><br /> <input
										class="cursor-pointer py-2 w-56 rounded-sm bg-blue-400 hover:bg-blue-300 text-white font-bold"
										type="submit" name="edit" value="編　集">
								</div>
								<br />
								<div class="p-4 border">
									<h1 class="p-4 text-2xl">タスク情報の削除</h1>
									<input
										class="cursor-pointer py-2 w-56 rounded-sm bg-red-400 hover:bg-red-300 text-white font-bold"
										type="submit" name="delete" value="削　除">
								</div>
							</div>
						</div>

					</form>

				</c:otherwise>
			</c:choose>

		</div>
	</main>
	<footer
		class="mt-8 w-full bottom-0 p-2 bg-blue-800 text-center font-mono text-sm text-white">
		<p>JPIN Exercise at 2021/07</p>
	</footer>

</body>
</html>