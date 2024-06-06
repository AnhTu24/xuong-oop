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

                            <h1>Cập nhật người dùng: {{ $user['name'] }}</h1>

                            @if (!empty($_SESSION['errors']))
                                <div class="alert alert-warning">
                                    <ul>
                                        @foreach ($_SESSION['errors'] as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>

                                    @php
                                        unset($_SESSION['errors']);
                                    @endphp
                                </div>
                            @endif

                            <form action="{{ url("admin/users/{$user['id']}/update") }}" enctype="multipart/form-data"
                                method="POST">
                                <div class="mb-3 mt-3">
                                    <label for="name" class="form-label">Name:</label>
                                    <input type="text" class="form-control" id="name" placeholder="Enter name"
                                        value="{{ $user['name'] }}" name="name">
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="email" class="form-label">Email:</label>
                                    <input type="email" class="form-control" id="email" placeholder="Enter email"
                                        value="{{ $user['email'] }}" name="email">
                                </div>
                                <div class="mb-3 mt-3">
                                    <label class="form-label">Role:</label>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="roleAdmin" name="role"
                                            value="admin" {{ $user['role'] == 'admin' ? 'checked' : '' }}>
                                        <label class="form-check-label" for="roleAdmin">Admin</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="roleUser" name="role"
                                            value="user" {{ $user['role'] == 'user' ? 'checked' : '' }}>
                                        <label class="form-check-label" for="roleUser">User</label>
                                    </div>
                                </div>
                                <div class="mb-3 mt-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="active" name="active"
                                        {{ $user['active'] ? 'checked' : '' }}>
                                    <label class="form-check-label" for="active">Active</label>
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="avatar" class="form-label">Avatar:</label>
                                    <input type="file" class="form-control" id="avatar" placeholder="Enter avatar"
                                        name="avatar">
                                    <img src="{{ asset($user['avatar']) }}" alt="" width="100px">
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="password" class="form-label">Password:</label>
                                    <input type="text" class="form-control" id="password" placeholder="Enter password"
                                        name="password">
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
