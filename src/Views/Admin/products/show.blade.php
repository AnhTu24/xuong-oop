@extends('layouts.master')

@section('title')
    Xem chi tiết: {{ $product['name'] }}
@endsection

@section('content')
    <table class="table table-striped">
        <thead>
            <tr>
                <th>TRƯỜNG</th>
                <th>GIÁ TRỊ</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($product as $key => $value)
                <tr>
                    <td>{{ $key }}</td>
                    <td>
                        @if (preg_match('/\.(jpg|jpeg|png|gif|bmp)$/i', $value))
                        <img src="{{ asset($product['img_thumbnail']) }}" width="100px" alt=""> 
                        @else
                            {!! $value !!}
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
