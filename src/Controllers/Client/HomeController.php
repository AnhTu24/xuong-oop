<?php 

namespace Ductong\FpolyBaseWeb3014\Controllers\Client;

use Ductong\FpolyBaseWeb3014\Commons\Controller;

class HomeController extends Controller
{
    public function index() {
        $name = 'DucTV44';

        $this->renderViewClient('home', [
            'name' => $name
        ]);
    }
}