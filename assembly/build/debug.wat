(module
 (type $0 (func (param f64 f64) (result f64)))
 (type $1 (func (param f64) (result f64)))
 (type $2 (func (param f64 i64) (result i32)))
 (type $3 (func (param f64 f64 i32) (result i32)))
 (global $~lib/math/NativeMath.PI f64 (f64.const 3.141592653589793))
 (global $~lib/native/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~lib/math/rempio2_y0 (mut f64) (f64.const 0))
 (global $~lib/math/rempio2_y1 (mut f64) (f64.const 0))
 (global $~lib/math/res128_hi (mut i64) (i64.const 0))
 (global $~lib/memory/__data_end i32 (i32.const 200))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 32968))
 (global $~lib/memory/__heap_base i32 (i32.const 32968))
 (memory $0 1)
 (data $0 (i32.const 8) "n\83\f9\a2\00\00\00\00\d1W\'\fc)\15DN\99\95b\db\c0\dd4\f5\abcQ\feA\90C<:n$\b7a\c5\bb\de\ea.I\06\e0\d2MB\1c\eb\1d\fe\1c\92\d1\t\f55\82\e8>\a7)\b1&p\9c\e9\84D\bb.9\d6\919A~_\b4\8b_\84\9c\f49S\83\ff\97\f8\1f;(\f9\bd\8b\11/\ef\0f\98\05\de\cf~6m\1fm\nZf?FO\b7\t\cb\'\c7\ba\'u-\ea_\9e\f79\07={\f1\e5\eb\b1_\fbk\ea\92R\8aF0\03V\08]\8d\1f \bc\cf\f0\abk{\fca\91\e3\a9\1d6\f4\9a_\85\99e\08\1b\e6^\80\d8\ff\8d@h\a0\14W\15\06\061\'sM")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "mandelbrot" (func $assembly/index/mandelbrot))
 (export "memory" (memory $0))
 (func $~lib/math/NativeMath.hypot (param $x f64) (param $y f64) (result f64)
  (local $ux i64)
  (local $uy i64)
  (local $ut i64)
  (local $ex i32)
  (local $ey i32)
  (local $z f64)
  (local $c f64)
  (local $h f64)
  (local $l f64)
  (local $hx f64)
  (local $lx f64)
  (local $hy f64)
  (local $ly f64)
  local.get $x
  i64.reinterpret_f64
  local.set $ux
  local.get $y
  i64.reinterpret_f64
  local.set $uy
  local.get $ux
  i64.const 9223372036854775807
  i64.and
  local.set $ux
  local.get $uy
  i64.const 9223372036854775807
  i64.and
  local.set $uy
  local.get $ux
  local.get $uy
  i64.lt_u
  if
   local.get $ux
   local.set $ut
   local.get $uy
   local.set $ux
   local.get $ut
   local.set $uy
  end
  local.get $ux
  i64.const 52
  i64.shr_u
  i32.wrap_i64
  local.set $ex
  local.get $uy
  i64.const 52
  i64.shr_u
  i32.wrap_i64
  local.set $ey
  local.get $uy
  f64.reinterpret_i64
  local.set $y
  local.get $ey
  i32.const 2047
  i32.eq
  if
   local.get $y
   return
  end
  local.get $ux
  f64.reinterpret_i64
  local.set $x
  local.get $ex
  i32.const 2047
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $uy
   i64.const 0
   i64.eq
  end
  if
   local.get $x
   return
  end
  local.get $ex
  local.get $ey
  i32.sub
  i32.const 64
  i32.gt_s
  if
   local.get $x
   local.get $y
   f64.add
   return
  end
  f64.const 1
  local.set $z
  local.get $ex
  i32.const 1023
  i32.const 510
  i32.add
  i32.gt_s
  if
   f64.const 5260135901548373507240989e186
   local.set $z
   local.get $x
   f64.const 1.90109156629516e-211
   f64.mul
   local.set $x
   local.get $y
   f64.const 1.90109156629516e-211
   f64.mul
   local.set $y
  else
   local.get $ey
   i32.const 1023
   i32.const 450
   i32.sub
   i32.lt_s
   if
    f64.const 1.90109156629516e-211
    local.set $z
    local.get $x
    f64.const 5260135901548373507240989e186
    f64.mul
    local.set $x
    local.get $y
    f64.const 5260135901548373507240989e186
    f64.mul
    local.set $y
   end
  end
  local.get $x
  f64.const 134217729
  f64.mul
  local.set $c
  local.get $x
  local.get $c
  f64.sub
  local.get $c
  f64.add
  local.set $h
  local.get $x
  local.get $h
  f64.sub
  local.set $l
  local.get $x
  local.get $x
  f64.mul
  local.set $hx
  local.get $h
  local.get $h
  f64.mul
  local.get $hx
  f64.sub
  f64.const 2
  local.get $h
  f64.mul
  local.get $l
  f64.add
  local.get $l
  f64.mul
  f64.add
  local.set $lx
  local.get $y
  f64.const 134217729
  f64.mul
  local.set $c
  local.get $y
  local.get $c
  f64.sub
  local.get $c
  f64.add
  local.set $h
  local.get $y
  local.get $h
  f64.sub
  local.set $l
  local.get $y
  local.get $y
  f64.mul
  local.set $hy
  local.get $h
  local.get $h
  f64.mul
  local.get $hy
  f64.sub
  f64.const 2
  local.get $h
  f64.mul
  local.get $l
  f64.add
  local.get $l
  f64.mul
  f64.add
  local.set $ly
  local.get $z
  local.get $ly
  local.get $lx
  f64.add
  local.get $hy
  f64.add
  local.get $hx
  f64.add
  f64.sqrt
  f64.mul
  return
 )
 (func $~lib/math/NativeMath.atan (param $x f64) (result f64)
  (local $ix i32)
  (local $sx f64)
  (local $z f64)
  (local $id i32)
  (local $w f64)
  (local $s1 f64)
  (local $s2 f64)
  (local $s3 f64)
  (local $9 i32)
  local.get $x
  i64.reinterpret_f64
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $ix
  local.get $x
  local.set $sx
  local.get $ix
  i32.const 2147483647
  i32.and
  local.set $ix
  local.get $ix
  i32.const 1141899264
  i32.ge_u
  if
   local.get $x
   local.get $x
   f64.ne
   if
    local.get $x
    return
   end
   f64.const 1.5707963267948966
   f32.const 7.52316384526264e-37
   f64.promote_f32
   f64.add
   local.set $z
   local.get $z
   local.get $sx
   f64.copysign
   return
  end
  local.get $ix
  i32.const 1071382528
  i32.lt_u
  if
   local.get $ix
   i32.const 1044381696
   i32.lt_u
   if
    local.get $x
    return
   end
   i32.const -1
   local.set $id
  else
   local.get $x
   f64.abs
   local.set $x
   local.get $ix
   i32.const 1072889856
   i32.lt_u
   if
    local.get $ix
    i32.const 1072037888
    i32.lt_u
    if
     i32.const 0
     local.set $id
     f64.const 2
     local.get $x
     f64.mul
     f64.const 1
     f64.sub
     f64.const 2
     local.get $x
     f64.add
     f64.div
     local.set $x
    else
     i32.const 1
     local.set $id
     local.get $x
     f64.const 1
     f64.sub
     local.get $x
     f64.const 1
     f64.add
     f64.div
     local.set $x
    end
   else
    local.get $ix
    i32.const 1073971200
    i32.lt_u
    if
     i32.const 2
     local.set $id
     local.get $x
     f64.const 1.5
     f64.sub
     f64.const 1
     f64.const 1.5
     local.get $x
     f64.mul
     f64.add
     f64.div
     local.set $x
    else
     i32.const 3
     local.set $id
     f64.const -1
     local.get $x
     f64.div
     local.set $x
    end
   end
  end
  local.get $x
  local.get $x
  f64.mul
  local.set $z
  local.get $z
  local.get $z
  f64.mul
  local.set $w
  local.get $z
  f64.const 0.3333333333333293
  local.get $w
  f64.const 0.14285714272503466
  local.get $w
  f64.const 0.09090887133436507
  local.get $w
  f64.const 0.06661073137387531
  local.get $w
  f64.const 0.049768779946159324
  local.get $w
  f64.const 0.016285820115365782
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  local.set $s1
  local.get $w
  f64.const -0.19999999999876483
  local.get $w
  f64.const -0.11111110405462356
  local.get $w
  f64.const -0.0769187620504483
  local.get $w
  f64.const -0.058335701337905735
  local.get $w
  f64.const -0.036531572744216916
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.mul
  local.set $s2
  local.get $x
  local.get $s1
  local.get $s2
  f64.add
  f64.mul
  local.set $s3
  local.get $id
  i32.const 0
  i32.lt_s
  if
   local.get $x
   local.get $s3
   f64.sub
   return
  end
  block $break|0
   block $case4|0
    block $case3|0
     block $case2|0
      block $case1|0
       block $case0|0
        local.get $id
        local.set $9
        local.get $9
        i32.const 0
        i32.eq
        br_if $case0|0
        local.get $9
        i32.const 1
        i32.eq
        br_if $case1|0
        local.get $9
        i32.const 2
        i32.eq
        br_if $case2|0
        local.get $9
        i32.const 3
        i32.eq
        br_if $case3|0
        br $case4|0
       end
       f64.const 0.4636476090008061
       local.get $s3
       f64.const 2.2698777452961687e-17
       f64.sub
       local.get $x
       f64.sub
       f64.sub
       local.set $z
       br $break|0
      end
      f64.const 0.7853981633974483
      local.get $s3
      f64.const 3.061616997868383e-17
      f64.sub
      local.get $x
      f64.sub
      f64.sub
      local.set $z
      br $break|0
     end
     f64.const 0.982793723247329
     local.get $s3
     f64.const 1.3903311031230998e-17
     f64.sub
     local.get $x
     f64.sub
     f64.sub
     local.set $z
     br $break|0
    end
    f64.const 1.5707963267948966
    local.get $s3
    f64.const 6.123233995736766e-17
    f64.sub
    local.get $x
    f64.sub
    f64.sub
    local.set $z
    br $break|0
   end
   unreachable
  end
  local.get $z
  local.get $sx
  f64.copysign
  return
 )
 (func $~lib/math/NativeMath.atan2 (param $y f64) (param $x f64) (result f64)
  (local $u i64)
  (local $ix i32)
  (local $lx i32)
  (local $iy i32)
  (local $ly i32)
  (local $m i32)
  (local $8 i32)
  (local $t f64)
  (local $t|10 f64)
  (local $z f64)
  (local $12 i32)
  local.get $x
  local.get $x
  f64.ne
  if (result i32)
   i32.const 1
  else
   local.get $y
   local.get $y
   f64.ne
  end
  if
   local.get $x
   local.get $y
   f64.add
   return
  end
  local.get $x
  i64.reinterpret_f64
  local.set $u
  local.get $u
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $ix
  local.get $u
  i32.wrap_i64
  local.set $lx
  local.get $y
  i64.reinterpret_f64
  local.set $u
  local.get $u
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $iy
  local.get $u
  i32.wrap_i64
  local.set $ly
  local.get $ix
  i32.const 1072693248
  i32.sub
  local.get $lx
  i32.or
  i32.const 0
  i32.eq
  if
   local.get $y
   call $~lib/math/NativeMath.atan
   return
  end
  local.get $iy
  i32.const 31
  i32.shr_u
  i32.const 1
  i32.and
  local.get $ix
  i32.const 30
  i32.shr_u
  i32.const 2
  i32.and
  i32.or
  local.set $m
  local.get $ix
  i32.const 2147483647
  i32.and
  local.set $ix
  local.get $iy
  i32.const 2147483647
  i32.and
  local.set $iy
  local.get $iy
  local.get $ly
  i32.or
  i32.const 0
  i32.eq
  if
   block $break|0
    block $case3|0
     block $case2|0
      block $case1|0
       block $case0|0
        local.get $m
        local.set $8
        local.get $8
        i32.const 0
        i32.eq
        br_if $case0|0
        local.get $8
        i32.const 1
        i32.eq
        br_if $case1|0
        local.get $8
        i32.const 2
        i32.eq
        br_if $case2|0
        local.get $8
        i32.const 3
        i32.eq
        br_if $case3|0
        br $break|0
       end
      end
      local.get $y
      return
     end
     global.get $~lib/math/NativeMath.PI
     return
    end
    global.get $~lib/math/NativeMath.PI
    f64.neg
    return
   end
  end
  local.get $ix
  local.get $lx
  i32.or
  i32.const 0
  i32.eq
  if
   local.get $m
   i32.const 1
   i32.and
   if (result f64)
    global.get $~lib/math/NativeMath.PI
    f64.neg
    f64.const 2
    f64.div
   else
    global.get $~lib/math/NativeMath.PI
    f64.const 2
    f64.div
   end
   return
  end
  local.get $ix
  i32.const 2146435072
  i32.eq
  if
   local.get $iy
   i32.const 2146435072
   i32.eq
   if
    local.get $m
    i32.const 2
    i32.and
    if (result f64)
     i32.const 3
     f64.convert_i32_s
     global.get $~lib/math/NativeMath.PI
     f64.mul
     f64.const 4
     f64.div
    else
     global.get $~lib/math/NativeMath.PI
     f64.const 4
     f64.div
    end
    local.set $t
    local.get $m
    i32.const 1
    i32.and
    if (result f64)
     local.get $t
     f64.neg
    else
     local.get $t
    end
    return
   else
    local.get $m
    i32.const 2
    i32.and
    if (result f64)
     global.get $~lib/math/NativeMath.PI
    else
     f64.const 0
    end
    local.set $t|10
    local.get $m
    i32.const 1
    i32.and
    if (result f64)
     local.get $t|10
     f64.neg
    else
     local.get $t|10
    end
    return
   end
   unreachable
  end
  local.get $ix
  i32.const 64
  i32.const 20
  i32.shl
  i32.add
  local.get $iy
  i32.lt_u
  if (result i32)
   i32.const 1
  else
   local.get $iy
   i32.const 2146435072
   i32.eq
  end
  if
   local.get $m
   i32.const 1
   i32.and
   if (result f64)
    global.get $~lib/math/NativeMath.PI
    f64.neg
    f64.const 2
    f64.div
   else
    global.get $~lib/math/NativeMath.PI
    f64.const 2
    f64.div
   end
   return
  end
  local.get $m
  i32.const 2
  i32.and
  if (result i32)
   local.get $iy
   i32.const 64
   i32.const 20
   i32.shl
   i32.add
   local.get $ix
   i32.lt_u
  else
   i32.const 0
  end
  if
   f64.const 0
   local.set $z
  else
   local.get $y
   local.get $x
   f64.div
   f64.abs
   call $~lib/math/NativeMath.atan
   local.set $z
  end
  block $break|1
   block $case3|1
    block $case2|1
     block $case1|1
      block $case0|1
       local.get $m
       local.set $12
       local.get $12
       i32.const 0
       i32.eq
       br_if $case0|1
       local.get $12
       i32.const 1
       i32.eq
       br_if $case1|1
       local.get $12
       i32.const 2
       i32.eq
       br_if $case2|1
       local.get $12
       i32.const 3
       i32.eq
       br_if $case3|1
       br $break|1
      end
      local.get $z
      return
     end
     local.get $z
     f64.neg
     return
    end
    global.get $~lib/math/NativeMath.PI
    local.get $z
    f64.const 1.2246467991473532e-16
    f64.sub
    f64.sub
    return
   end
   local.get $z
   f64.const 1.2246467991473532e-16
   f64.sub
   global.get $~lib/math/NativeMath.PI
   f64.sub
   return
  end
  unreachable
 )
 (func $~lib/math/pio2_large_quot (param $x f64) (param $u i64) (result i32)
  (local $magnitude i64)
  (local $offset i64)
  (local $shift i64)
  (local $tblPtr i32)
  (local $s0 i64)
  (local $s1 i64)
  (local $s2 i64)
  (local $b0 i64)
  (local $b1 i64)
  (local $b2 i64)
  (local $rshift i64)
  (local $b3 i64)
  (local $significand i64)
  (local $u|15 i64)
  (local $v i64)
  (local $u1 i64)
  (local $v1 i64)
  (local $w0 i64)
  (local $w1 i64)
  (local $t i64)
  (local $blo i64)
  (local $bhi i64)
  (local $ahi i64)
  (local $clo i64)
  (local $plo i64)
  (local $phi i64)
  (local $rlo i64)
  (local $rhi i64)
  (local $slo i64)
  (local $shi i64)
  (local $q i64)
  (local $q0 i64)
  (local $q1 i64)
  (local $shift|35 i64)
  (local $u|36 i64)
  (local $v|37 i64)
  (local $u1|38 i64)
  (local $v1|39 i64)
  (local $w0|40 i64)
  (local $w1|41 i64)
  (local $t|42 i64)
  (local $lo i64)
  (local $hi i64)
  (local $ahi|45 i64)
  (local $alo i64)
  (local $blo|47 i64)
  (local $shifter i64)
  (local $signbit i64)
  (local $coeff f64)
  local.get $u
  i64.const 9223372036854775807
  i64.and
  local.set $magnitude
  local.get $magnitude
  i64.const 52
  i64.shr_s
  i64.const 1045
  i64.sub
  local.set $offset
  local.get $offset
  i64.const 63
  i64.and
  local.set $shift
  i32.const 8
  local.get $offset
  i64.const 6
  i64.shr_s
  i32.wrap_i64
  i32.const 3
  i32.shl
  i32.add
  local.set $tblPtr
  local.get $tblPtr
  i64.load
  local.set $b0
  local.get $tblPtr
  i64.load offset=8
  local.set $b1
  local.get $tblPtr
  i64.load offset=16
  local.set $b2
  local.get $shift
  i64.const 0
  i64.ne
  if
   i32.const 64
   i64.extend_i32_s
   local.get $shift
   i64.sub
   local.set $rshift
   local.get $tblPtr
   i64.load offset=24
   local.set $b3
   local.get $b1
   local.get $rshift
   i64.shr_u
   local.get $b0
   local.get $shift
   i64.shl
   i64.or
   local.set $s0
   local.get $b2
   local.get $rshift
   i64.shr_u
   local.get $b1
   local.get $shift
   i64.shl
   i64.or
   local.set $s1
   local.get $b3
   local.get $rshift
   i64.shr_u
   local.get $b2
   local.get $shift
   i64.shl
   i64.or
   local.set $s2
  else
   local.get $b0
   local.set $s0
   local.get $b1
   local.set $s1
   local.get $b2
   local.set $s2
  end
  local.get $u
  i64.const 4503599627370495
  i64.and
  i64.const 4503599627370496
  i64.or
  local.set $significand
  block $~lib/math/umuldi|inlined.0 (result i64)
   local.get $s1
   local.set $u|15
   local.get $significand
   local.set $v
   local.get $u|15
   i64.const 4294967295
   i64.and
   local.set $u1
   local.get $v
   i64.const 4294967295
   i64.and
   local.set $v1
   local.get $u|15
   i64.const 32
   i64.shr_u
   local.set $u|15
   local.get $v
   i64.const 32
   i64.shr_u
   local.set $v
   local.get $u1
   local.get $v1
   i64.mul
   local.set $t
   local.get $t
   i64.const 4294967295
   i64.and
   local.set $w0
   local.get $u|15
   local.get $v1
   i64.mul
   local.get $t
   i64.const 32
   i64.shr_u
   i64.add
   local.set $t
   local.get $t
   i64.const 32
   i64.shr_u
   local.set $w1
   local.get $u1
   local.get $v
   i64.mul
   local.get $t
   i64.const 4294967295
   i64.and
   i64.add
   local.set $t
   local.get $u|15
   local.get $v
   i64.mul
   local.get $w1
   i64.add
   local.get $t
   i64.const 32
   i64.shr_u
   i64.add
   global.set $~lib/math/res128_hi
   local.get $t
   i64.const 32
   i64.shl
   local.get $w0
   i64.add
   br $~lib/math/umuldi|inlined.0
  end
  local.set $blo
  global.get $~lib/math/res128_hi
  local.set $bhi
  local.get $s0
  local.get $significand
  i64.mul
  local.set $ahi
  local.get $s2
  i64.const 32
  i64.shr_u
  local.get $significand
  i64.const 32
  i64.shr_s
  i64.mul
  local.set $clo
  local.get $blo
  local.get $clo
  i64.add
  local.set $plo
  local.get $ahi
  local.get $bhi
  i64.add
  local.get $plo
  local.get $clo
  i64.lt_u
  i64.extend_i32_u
  i64.add
  local.set $phi
  local.get $plo
  i64.const 2
  i64.shl
  local.set $rlo
  local.get $phi
  i64.const 2
  i64.shl
  local.get $plo
  i64.const 62
  i64.shr_u
  i64.or
  local.set $rhi
  local.get $rhi
  i64.const 63
  i64.shr_s
  local.set $slo
  local.get $slo
  i64.const 1
  i64.shr_s
  local.set $shi
  local.get $phi
  i64.const 62
  i64.shr_s
  local.get $slo
  i64.sub
  local.set $q
  i64.const 4372995238176751616
  block $~lib/math/pio2_right|inlined.0 (result i64)
   local.get $rlo
   local.get $slo
   i64.xor
   local.set $q0
   local.get $rhi
   local.get $shi
   i64.xor
   local.set $q1
   local.get $q1
   i64.clz
   local.set $shift|35
   local.get $q1
   local.get $shift|35
   i64.shl
   local.get $q0
   i64.const 64
   local.get $shift|35
   i64.sub
   i64.shr_u
   i64.or
   local.set $q1
   local.get $q0
   local.get $shift|35
   i64.shl
   local.set $q0
   block $~lib/math/umuldi|inlined.1 (result i64)
    i64.const -3958705157555305932
    local.set $u|36
    local.get $q1
    local.set $v|37
    local.get $u|36
    i64.const 4294967295
    i64.and
    local.set $u1|38
    local.get $v|37
    i64.const 4294967295
    i64.and
    local.set $v1|39
    local.get $u|36
    i64.const 32
    i64.shr_u
    local.set $u|36
    local.get $v|37
    i64.const 32
    i64.shr_u
    local.set $v|37
    local.get $u1|38
    local.get $v1|39
    i64.mul
    local.set $t|42
    local.get $t|42
    i64.const 4294967295
    i64.and
    local.set $w0|40
    local.get $u|36
    local.get $v1|39
    i64.mul
    local.get $t|42
    i64.const 32
    i64.shr_u
    i64.add
    local.set $t|42
    local.get $t|42
    i64.const 32
    i64.shr_u
    local.set $w1|41
    local.get $u1|38
    local.get $v|37
    i64.mul
    local.get $t|42
    i64.const 4294967295
    i64.and
    i64.add
    local.set $t|42
    local.get $u|36
    local.get $v|37
    i64.mul
    local.get $w1|41
    i64.add
    local.get $t|42
    i64.const 32
    i64.shr_u
    i64.add
    global.set $~lib/math/res128_hi
    local.get $t|42
    i64.const 32
    i64.shl
    local.get $w0|40
    i64.add
    br $~lib/math/umuldi|inlined.1
   end
   local.set $lo
   global.get $~lib/math/res128_hi
   local.set $hi
   local.get $hi
   i64.const 11
   i64.shr_u
   local.set $ahi|45
   local.get $lo
   i64.const 11
   i64.shr_u
   local.get $hi
   i64.const 53
   i64.shl
   i64.or
   local.set $alo
   f64.const 2.6469779601696886e-23
   i64.const -4267615245585081135
   f64.convert_i64_u
   f64.mul
   local.get $q1
   f64.convert_i64_u
   f64.mul
   f64.const 2.6469779601696886e-23
   i64.const -3958705157555305932
   f64.convert_i64_u
   f64.mul
   local.get $q0
   f64.convert_i64_u
   f64.mul
   f64.add
   i64.trunc_sat_f64_u
   local.set $blo|47
   local.get $ahi|45
   local.get $lo
   local.get $blo|47
   i64.lt_u
   i64.extend_i32_u
   i64.add
   f64.convert_i64_u
   global.set $~lib/math/rempio2_y0
   f64.const 5.421010862427522e-20
   local.get $alo
   local.get $blo|47
   i64.add
   f64.convert_i64_u
   f64.mul
   global.set $~lib/math/rempio2_y1
   local.get $shift|35
   br $~lib/math/pio2_right|inlined.0
  end
  i64.const 52
  i64.shl
  i64.sub
  local.set $shifter
  local.get $u
  local.get $rhi
  i64.xor
  i64.const -9223372036854775808
  i64.and
  local.set $signbit
  local.get $shifter
  local.get $signbit
  i64.or
  f64.reinterpret_i64
  local.set $coeff
  global.get $~lib/math/rempio2_y0
  local.get $coeff
  f64.mul
  global.set $~lib/math/rempio2_y0
  global.get $~lib/math/rempio2_y1
  local.get $coeff
  f64.mul
  global.set $~lib/math/rempio2_y1
  local.get $q
  i32.wrap_i64
  return
 )
 (func $~lib/math/NativeMath.cos (param $x f64) (result f64)
  (local $u i64)
  (local $ux i32)
  (local $sign i32)
  (local $x|4 f64)
  (local $y f64)
  (local $z f64)
  (local $w f64)
  (local $r f64)
  (local $hz f64)
  (local $x|10 f64)
  (local $u|11 i64)
  (local $sign|12 i32)
  (local $ix i32)
  (local $q i32)
  (local $z|15 f64)
  (local $y0 f64)
  (local $y1 f64)
  (local $q|18 f64)
  (local $r|19 f64)
  (local $w|20 f64)
  (local $j i32)
  (local $y0|22 f64)
  (local $hi i32)
  (local $i i32)
  (local $t f64)
  (local $t|26 f64)
  (local $y1|27 f64)
  (local $q|28 i32)
  (local $n i32)
  (local $y0|30 f64)
  (local $y1|31 f64)
  (local $x|32 f64)
  (local $y|33 f64)
  (local $iy i32)
  (local $z|35 f64)
  (local $w|36 f64)
  (local $r|37 f64)
  (local $v f64)
  (local $x|39 f64)
  (local $y|40 f64)
  (local $z|41 f64)
  (local $w|42 f64)
  (local $r|43 f64)
  (local $hz|44 f64)
  local.get $x
  i64.reinterpret_f64
  local.set $u
  local.get $u
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $ux
  local.get $ux
  i32.const 31
  i32.shr_u
  local.set $sign
  local.get $ux
  i32.const 2147483647
  i32.and
  local.set $ux
  local.get $ux
  i32.const 1072243195
  i32.le_u
  if
   local.get $ux
   i32.const 1044816030
   i32.lt_u
   if
    f64.const 1
    return
   end
   block $~lib/math/cos_kern|inlined.0 (result f64)
    local.get $x
    local.set $x|4
    f64.const 0
    local.set $y
    local.get $x|4
    local.get $x|4
    f64.mul
    local.set $z
    local.get $z
    local.get $z
    f64.mul
    local.set $w
    local.get $z
    f64.const 0.0416666666666666
    local.get $z
    f64.const -0.001388888888887411
    local.get $z
    f64.const 2.480158728947673e-05
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.mul
    local.get $w
    local.get $w
    f64.mul
    f64.const -2.7557314351390663e-07
    local.get $z
    f64.const 2.087572321298175e-09
    local.get $z
    f64.const -1.1359647557788195e-11
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.mul
    f64.add
    local.set $r
    f64.const 0.5
    local.get $z
    f64.mul
    local.set $hz
    f64.const 1
    local.get $hz
    f64.sub
    local.set $w
    local.get $w
    f64.const 1
    local.get $w
    f64.sub
    local.get $hz
    f64.sub
    local.get $z
    local.get $r
    f64.mul
    local.get $x|4
    local.get $y
    f64.mul
    f64.sub
    f64.add
    f64.add
    br $~lib/math/cos_kern|inlined.0
   end
   return
  end
  local.get $ux
  i32.const 2146435072
  i32.ge_u
  if
   local.get $x
   local.get $x
   f64.sub
   return
  end
  block $~lib/math/rempio2|inlined.0 (result i32)
   local.get $x
   local.set $x|10
   local.get $u
   local.set $u|11
   local.get $sign
   local.set $sign|12
   local.get $u|11
   i64.const 32
   i64.shr_u
   i32.wrap_i64
   i32.const 2147483647
   i32.and
   local.set $ix
   i32.const 0
   i32.const 1
   i32.lt_s
   drop
   local.get $ix
   i32.const 1073928572
   i32.lt_u
   if
    i32.const 1
    local.set $q
    local.get $sign|12
    i32.eqz
    if
     local.get $x|10
     f64.const 1.5707963267341256
     f64.sub
     local.set $z|15
     local.get $ix
     i32.const 1073291771
     i32.ne
     if
      local.get $z|15
      f64.const 6.077100506506192e-11
      f64.sub
      local.set $y0
      local.get $z|15
      local.get $y0
      f64.sub
      f64.const 6.077100506506192e-11
      f64.sub
      local.set $y1
     else
      local.get $z|15
      f64.const 6.077100506303966e-11
      f64.sub
      local.set $z|15
      local.get $z|15
      f64.const 2.0222662487959506e-21
      f64.sub
      local.set $y0
      local.get $z|15
      local.get $y0
      f64.sub
      f64.const 2.0222662487959506e-21
      f64.sub
      local.set $y1
     end
    else
     local.get $x|10
     f64.const 1.5707963267341256
     f64.add
     local.set $z|15
     local.get $ix
     i32.const 1073291771
     i32.ne
     if
      local.get $z|15
      f64.const 6.077100506506192e-11
      f64.add
      local.set $y0
      local.get $z|15
      local.get $y0
      f64.sub
      f64.const 6.077100506506192e-11
      f64.add
      local.set $y1
     else
      local.get $z|15
      f64.const 6.077100506303966e-11
      f64.add
      local.set $z|15
      local.get $z|15
      f64.const 2.0222662487959506e-21
      f64.add
      local.set $y0
      local.get $z|15
      local.get $y0
      f64.sub
      f64.const 2.0222662487959506e-21
      f64.add
      local.set $y1
     end
     i32.const -1
     local.set $q
    end
    local.get $y0
    global.set $~lib/math/rempio2_y0
    local.get $y1
    global.set $~lib/math/rempio2_y1
    local.get $q
    br $~lib/math/rempio2|inlined.0
   end
   local.get $ix
   i32.const 1094263291
   i32.lt_u
   if
    local.get $x|10
    f64.const 0.6366197723675814
    f64.mul
    f64.nearest
    local.set $q|18
    local.get $x|10
    local.get $q|18
    f64.const 1.5707963267341256
    f64.mul
    f64.sub
    local.set $r|19
    local.get $q|18
    f64.const 6.077100506506192e-11
    f64.mul
    local.set $w|20
    local.get $ix
    i32.const 20
    i32.shr_u
    local.set $j
    local.get $r|19
    local.get $w|20
    f64.sub
    local.set $y0|22
    local.get $y0|22
    i64.reinterpret_f64
    i64.const 32
    i64.shr_u
    i32.wrap_i64
    local.set $hi
    local.get $j
    local.get $hi
    i32.const 20
    i32.shr_u
    i32.const 2047
    i32.and
    i32.sub
    local.set $i
    local.get $i
    i32.const 16
    i32.gt_u
    if
     local.get $r|19
     local.set $t
     local.get $q|18
     f64.const 6.077100506303966e-11
     f64.mul
     local.set $w|20
     local.get $t
     local.get $w|20
     f64.sub
     local.set $r|19
     local.get $q|18
     f64.const 2.0222662487959506e-21
     f64.mul
     local.get $t
     local.get $r|19
     f64.sub
     local.get $w|20
     f64.sub
     f64.sub
     local.set $w|20
     local.get $r|19
     local.get $w|20
     f64.sub
     local.set $y0|22
     local.get $y0|22
     i64.reinterpret_f64
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     local.set $hi
     local.get $j
     local.get $hi
     i32.const 20
     i32.shr_u
     i32.const 2047
     i32.and
     i32.sub
     local.set $i
     local.get $i
     i32.const 49
     i32.gt_u
     if
      local.get $r|19
      local.set $t|26
      local.get $q|18
      f64.const 2.0222662487111665e-21
      f64.mul
      local.set $w|20
      local.get $t|26
      local.get $w|20
      f64.sub
      local.set $r|19
      local.get $q|18
      f64.const 8.4784276603689e-32
      f64.mul
      local.get $t|26
      local.get $r|19
      f64.sub
      local.get $w|20
      f64.sub
      f64.sub
      local.set $w|20
      local.get $r|19
      local.get $w|20
      f64.sub
      local.set $y0|22
     end
    end
    local.get $r|19
    local.get $y0|22
    f64.sub
    local.get $w|20
    f64.sub
    local.set $y1|27
    local.get $y0|22
    global.set $~lib/math/rempio2_y0
    local.get $y1|27
    global.set $~lib/math/rempio2_y1
    local.get $q|18
    i32.trunc_sat_f64_s
    br $~lib/math/rempio2|inlined.0
   end
   local.get $x|10
   local.get $u|11
   call $~lib/math/pio2_large_quot
   local.set $q|28
   i32.const 0
   local.get $q|28
   i32.sub
   local.get $q|28
   local.get $sign|12
   select
   br $~lib/math/rempio2|inlined.0
  end
  local.set $n
  global.get $~lib/math/rempio2_y0
  local.set $y0|30
  global.get $~lib/math/rempio2_y1
  local.set $y1|31
  local.get $n
  i32.const 1
  i32.and
  if (result f64)
   block $~lib/math/sin_kern|inlined.0 (result f64)
    local.get $y0|30
    local.set $x|32
    local.get $y1|31
    local.set $y|33
    i32.const 1
    local.set $iy
    local.get $x|32
    local.get $x|32
    f64.mul
    local.set $z|35
    local.get $z|35
    local.get $z|35
    f64.mul
    local.set $w|36
    f64.const 0.00833333333332249
    local.get $z|35
    f64.const -1.984126982985795e-04
    local.get $z|35
    f64.const 2.7557313707070068e-06
    f64.mul
    f64.add
    f64.mul
    f64.add
    local.get $z|35
    local.get $w|36
    f64.mul
    f64.const -2.5050760253406863e-08
    local.get $z|35
    f64.const 1.58969099521155e-10
    f64.mul
    f64.add
    f64.mul
    f64.add
    local.set $r|37
    local.get $z|35
    local.get $x|32
    f64.mul
    local.set $v
    local.get $iy
    i32.eqz
    if
     local.get $x|32
     local.get $v
     f64.const -0.16666666666666632
     local.get $z|35
     local.get $r|37
     f64.mul
     f64.add
     f64.mul
     f64.add
     br $~lib/math/sin_kern|inlined.0
    else
     local.get $x|32
     local.get $z|35
     f64.const 0.5
     local.get $y|33
     f64.mul
     local.get $v
     local.get $r|37
     f64.mul
     f64.sub
     f64.mul
     local.get $y|33
     f64.sub
     local.get $v
     f64.const -0.16666666666666632
     f64.mul
     f64.sub
     f64.sub
     br $~lib/math/sin_kern|inlined.0
    end
    unreachable
   end
  else
   block $~lib/math/cos_kern|inlined.1 (result f64)
    local.get $y0|30
    local.set $x|39
    local.get $y1|31
    local.set $y|40
    local.get $x|39
    local.get $x|39
    f64.mul
    local.set $z|41
    local.get $z|41
    local.get $z|41
    f64.mul
    local.set $w|42
    local.get $z|41
    f64.const 0.0416666666666666
    local.get $z|41
    f64.const -0.001388888888887411
    local.get $z|41
    f64.const 2.480158728947673e-05
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.mul
    local.get $w|42
    local.get $w|42
    f64.mul
    f64.const -2.7557314351390663e-07
    local.get $z|41
    f64.const 2.087572321298175e-09
    local.get $z|41
    f64.const -1.1359647557788195e-11
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.mul
    f64.add
    local.set $r|43
    f64.const 0.5
    local.get $z|41
    f64.mul
    local.set $hz|44
    f64.const 1
    local.get $hz|44
    f64.sub
    local.set $w|42
    local.get $w|42
    f64.const 1
    local.get $w|42
    f64.sub
    local.get $hz|44
    f64.sub
    local.get $z|41
    local.get $r|43
    f64.mul
    local.get $x|39
    local.get $y|40
    f64.mul
    f64.sub
    f64.add
    f64.add
    br $~lib/math/cos_kern|inlined.1
   end
  end
  local.set $x
  local.get $n
  i32.const 1
  i32.add
  i32.const 2
  i32.and
  if (result f64)
   local.get $x
   f64.neg
  else
   local.get $x
  end
  return
 )
 (func $assembly/index/mandelbrot (param $real f64) (param $imaginary f64) (param $iterations i32) (result i32)
  (local $currentR f64)
  (local $currentI f64)
  (local $temporalyR f64)
  (local $temporalyI f64)
  (local $r f64)
  (local $theta f64)
  (local $boundary f64)
  (local $i i32)
  f64.const 0
  local.set $currentR
  f64.const 0
  local.set $currentI
  f64.const 0
  local.set $temporalyR
  f64.const 0
  local.set $temporalyI
  local.get $real
  local.get $imaginary
  call $~lib/math/NativeMath.hypot
  local.set $r
  local.get $imaginary
  local.get $real
  call $~lib/math/NativeMath.atan2
  local.set $theta
  f64.const 1
  local.get $theta
  call $~lib/math/NativeMath.cos
  f64.sub
  f64.const 2
  f64.div
  local.set $boundary
  local.get $r
  local.get $boundary
  f64.le
  if
   i32.const 0
   return
  end
  i32.const 1
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $iterations
   i32.le_s
   if
    local.get $currentR
    local.get $currentR
    f64.mul
    local.get $currentI
    local.get $currentI
    f64.mul
    f64.sub
    local.get $real
    f64.add
    local.set $temporalyR
    f64.const 2
    local.get $currentR
    f64.mul
    local.get $currentI
    f64.mul
    local.get $imaginary
    f64.add
    local.set $temporalyI
    local.get $temporalyR
    local.get $temporalyR
    f64.mul
    local.get $temporalyI
    local.get $temporalyI
    f64.mul
    f64.add
    f64.const 4
    f64.ge
    if
     local.get $i
     return
    end
    local.get $temporalyR
    local.set $currentR
    local.get $temporalyI
    local.set $currentI
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  return
 )
)
