<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{

      public function register(Request $request) {
        $name = $request->name;
        $email = $request->email;
        $password = Hash::make($request->password);

        // CREATE USER
        $user = new User();

        $user->name = $name;
        $user->email = $email;
        $user->password = $password;

        $status = $user->save();
       
        return ['status' => $status];
    }
    
    public function login(Request $request) {
        $info = [
            'email' => $request->email,
            'password' => $request->password,
        ];
        # AUTHENTICATE TO SERVER
        if (!Auth::attempt($info)) return null;
        return Auth::user();
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
