<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Http\Request;
use App\Eloquent as E;
use Hash;
use Validator;

class User extends Authenticatable
{
    use Notifiable;

    public static function create(Request $request, $user) {
        if ($user == null) return E::log(false, 'No user found');


        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required'
        ]);


        if ($validator->fails()) return E::log(false, $validator->errors());

        $role = trim($request->roll);

        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);

        if ($email != null) {
            if (User::isRole($role)) {
                $user->role = $role;
            } else {
                return E::log(false, 'Role is invalid');
            }
        }
        
        return E::log($user->save(), [
            'Save user fail',
            'Save user success'
        ]);
    }

    public static function isRole($roleId) {
        if (!is_numeric($roleId)) return false;
        return $roleId >= 0 && $roleId < count(config('role'));
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
