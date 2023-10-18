<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<div class="d-flex flex-column flex-shrink-0 p-3 bg-secondary-subtle " style="width: 200px; min-height: 75vh;">
    <span class="fw-bold text-black mx-auto">관리자 페이지</span>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
            <a href="/admin" class="nav-link text-black fw-bolder" aria-current="page">
                메인화면
            </a>
        </li>
        <li>
            <a href="/admin/members" class="nav-link text-black fw-bolder">
                회원관리
            </a>
        </li>
        <li>
            <a href="/admin/item" class="nav-link text-black fw-bolder">
                상품문의
            </a>
        </li>
        <li>
            <a href="#" class="nav-link text-black fw-bolder">
                Q&A
            </a>
        </li>

        <hr>

        <li>
            <a href="#" class="nav-link text-black fw-bolder">
                추천
            </a>
        </li>
        <li>
            <a href="#" class="nav-link text-black fw-bolder">
                구매가이드
            </a>
        </li>
        <li>
            <a href="/admin/store" class="nav-link text-black fw-bolder">
                이번주특가
            </a>
        </li>
    </ul>
</div>