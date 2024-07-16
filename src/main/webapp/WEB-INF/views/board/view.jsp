<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기 화면</title>
    <style>
        body {
            font-family: 'Noto Sans KR', 'Malgun Gothic', Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            margin: 20px auto;
            max-width: 800px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        h2 {
            color: #333333;
            font-size: 32px;
            margin-bottom: 10px;
        }
        p {
            color: #666666;
            line-height: 1.8;
        }
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            margin-right: 10px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }
        .btn-edit {
            background-color: #28a745;
            margin-left: 15px;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .comment-section {
            margin-top: 30px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .comment {
            background-color: #ffffff;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .comment .meta {
            color: #999999;
            font-size: 14px;
            margin-bottom: 5px;
        }
        .comment .content {
            color: #333333;
            font-size: 16px;
            line-height: 1.6;
        }
        .comment-form {
            margin-top: 30px;
        }
        .comment-form textarea {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            border: 1px solid #cccccc;
            border-radius: 8px;
            resize: vertical;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .comment-form .btn-submit {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .comment-form .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${board.title}</h2>
        <p>${board.content}</p>
        <p><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/></p>
    </div>
    <c:if test="${board.userId == userId}">
        <a href="${pageContext.request.contextPath}/board/edit?id=${board.id}" class="btn btn-edit">수정</a>
        <a href="${pageContext.request.contextPath}/board/delete?id=${board.id}" class="btn btn-delete">삭제</a>
    </c:if>

    <a href="${pageContext.request.contextPath}/board/list?page=1" class="btn">목록으로</a>

    <div class="comment-section">
        <h3>댓글</h3>
        <!-- 댓글 리스트 -->
        <div class="comment">
            <div class="meta">작성자: 홍길동 | 작성일: 2024-07-16 10:30</div>
            <div class="content">첫 번째 댓글입니다. 이 사이트 너무 좋아요!</div>
        </div>
        <div class="comment">
            <div class="meta">작성자: 임꺽정 | 작성일: 2024-07-16 11:00</div>
            <div class="content">두 번째 댓글입니다. 디자인도 멋지네요.</div>
        </div>

        <!-- 댓글 작성 폼 -->
        <div class="comment-form">
            <form action="${pageContext.request.contextPath}/board/comment" method="post">
                <textarea name="comment" rows="4" placeholder="댓글을 입력하세요..." required></textarea><br>
                <input type="submit" value="댓글 작성" class="btn btn-submit">
            </form>
        </div>
    </div>
</body>
</html>
