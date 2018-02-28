<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Http\Request;
use App\Eloquent as E;
use Hash;

class User extends Authenticatable
{
    use Notifiable;

    public static function save(Request $request, $user) {
        if ($user == null) return E::log(false, 'No user found');
        
        $name = trim($request->name);
        $email = trim($request->email);
        $password = trim($request->password);
        $role = trim($request->roll);

        if ($name != null) $user->name = $name;
        if ($email != null) $user->email = $email;
        if ($password != null) $user->password = Hash::make($password);

        if ($email != null) {
            if (User::isRole($role)) {
                $user->role = $role;
            } else {
                return E::log(false, 'Role is invalid');
            }
        }
        
        return E::log($user->save, [
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
