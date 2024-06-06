@extends('layouts.master')

@section('title')
    Danh sách User
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="white_card card_height_100 mb_30">
                <div class="white_card_header">
                    <div class="box_header m-0">
                        <div class="main-title">
                            <h1 class="m-0">Danh sách User</h1>
                        </div>
                    </div>
                </div>
                <div class="white_card_body">

                    <a class="btn btn-primary" href="{{ url('admin/users/create') }}">Thêm mới</a>

                    @if (isset($_SESSION['status']) && $_SESSION['status'])
                        <div class="alert alert-success">
                            {{ $_SESSION['msg'] }}
                        </div>

                        @php
                            unset($_SESSION['status']);
                            unset($_SESSION['msg']);
                        @endphp
                    @endif

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>IMAGE</th>
                                    <th>NAME</th>
                                    <th>EMAIL</th>
                                    <th>ROLE</th>
                                    <th>ACTIVE</th>
                                    <th>CREATED AT</th>
                                    <th>UPDATED AT</th>
                                    <th>ACTION</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($users as $user)
                                    <tr>
                                        <td><?= $user['id'] ?></td>
                                        <td>
                                            <img src="{{ asset($user['avatar']) }}" alt="" width="100px">
                                        </td>
                                        <td><?= $user['name'] ?></td>
                                        <td><?= $user['email'] ?></td>
                                        <td><?= $user['role'] ?></td>
                                        <td>{{ $user['active'] ? 'Hoạt động' : 'Không hoạt động' }}</td>
                                        <td><?= $user['created_at'] ?></td>
                                        <td><?= $user['updated_at'] ?></td>
                                        <td>

                                            <a class="btn btn-info"
                                                href="{{ url('admin/users/' . $user['id'] . '/show') }}">Xem</a>
                                            <a class="btn btn-warning"
                                                href="{{ url('admin/users/' . $user['id'] . '/edit') }}">Sửa</a>
                                            <a class="btn btn-danger"
                                                href="{{ url('admin/users/' . $user['id'] . '/delete') }}"
                                                onclick="return confirm('Chắc chắn xóa không?')">Xóa</a>

                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center pagination-lg">
                            {{-- Nút về trang đầu --}}
                            <li class="page-item {{ $currentPage == 1 ? 'disabled' : '' }}">
                                <a class="page-link" href="?page=1" aria-label="First">
                                    <span aria-hidden="true">&laquo;&laquo;</span>
                                </a>
                            </li>
        
                            {{-- Nút về trang trước --}}
                            @if ($currentPage > 1)
                                <li class="page-item">
                                    <a class="page-link" href="?page={{ $currentPage - 1 }}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            @endif
        
                            {{-- Hiển thị số trang --}}
                            @php
                                $startPage = max(1, $currentPage - 1);
                                $endPage = min($totalPage, $currentPage + 1);
                            @endphp
        
                            @for ($i = $startPage; $i <= $endPage; $i++)
                                <li class="page-item {{ $i == $currentPage ? 'active' : '' }}">
                                    <a class="page-link" href="?page={{ $i }}">{{ $i }}</a>
                                </li>
                            @endfor
        
                            {{-- Nút đến trang sau --}}
                            @if ($currentPage < $totalPage)
                                <li class="page-item">
                                    <a class="page-link" href="?page={{ $currentPage + 1 }}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            @endif
        
                            {{-- Nút đến trang cuối --}}
                            <li class="page-item {{ $currentPage == $totalPage ? 'disabled' : '' }}">
                                <a class="page-link" href="?page={{ $totalPage }}" aria-label="Last">
                                    <span aria-hidden="true">&raquo;&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
@endsection