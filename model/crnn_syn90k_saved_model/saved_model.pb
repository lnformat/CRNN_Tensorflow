è½
×+®+
:
Add
x"T
y"T
z"T"
Ttype:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
ò
CTCBeamSearchDecoder

inputs
sequence_length
decoded_indices	*	top_paths
decoded_values	*	top_paths
decoded_shape	*	top_paths
log_probability"

beam_widthint(0"
	top_pathsint(0"
merge_repeatedbool(
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
ì
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

y
Enter	
data"T
output"T"	
Ttype"

frame_namestring"
is_constantbool( "
parallel_iterationsint

B
Equal
x"T
y"T
z
"
Ttype:
2	

)
Exit	
data"T
output"T"	
Ttype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
,
Floor
x"T
y"T"
Ttype:
2

FusedBatchNorm
x"T

scale"T
offset"T	
mean"T
variance"T
y"T

batch_mean"T
batch_variance"T
reserve_space_1"T
reserve_space_2"T"
Ttype:
2"
epsilonfloat%·Ñ8"-
data_formatstringNHWC:
NHWCNCHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
$

LogicalAnd
x

y

z

!
LoopCond	
input


output

p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
Ô
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
;
Maximum
x"T
y"T
z"T"
Ttype:

2	
N
Merge
inputs"T*N
output"T
value_index"	
Ttype"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
;
Minimum
x"T
y"T
z"T"
Ttype:

2	
=
Mul
x"T
y"T
z"T"
Ttype:
2	
2
NextIteration	
data"T
output"T"	
Ttype

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
	ReverseV2
tensor"T
axis"Tidx
output"T"
Tidxtype0:
2	"
Ttype:
2	

l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
9
Softmax
logits"T
softmax"T"
Ttype:
2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
M
Switch	
data"T
pred

output_false"T
output_true"T"	
Ttype
-
Tanh
x"T
y"T"
Ttype:

2
{
TensorArrayGatherV3

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:
Y
TensorArrayReadV3

handle	
index
flow_in
value"dtype"
dtypetype
d
TensorArrayScatterV3

handle
indices

value"T
flow_in
flow_out"	
Ttype
9
TensorArraySizeV3

handle
flow_in
size
Þ
TensorArrayV3
size

handle
flow"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("$
identical_element_shapesbool( "
tensor_array_namestring 
`
TensorArrayWriteV3

handle	
index

value"T
flow_in
flow_out"	
Ttype
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	

TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*1.12.02v1.12.0-0-ga6d8ffae09Í
m
input_tensorPlaceholder*
dtype0*&
_output_shapes
: d*
shape: d
J
ConstConst*
valueB
 Btest*
dtype0*
_output_shapes
: 
M
Const_1Const*
dtype0*
_output_shapes
: *
valueB Btrain
?
EqualEqualConstConst_1*
T0*
_output_shapes
: 
Y
shadow_net/truediv/yConst*
valueB
 *  C*
dtype0*
_output_shapes
: 
r
shadow_net/truedivRealDivinput_tensorshadow_net/truediv/y*&
_output_shapes
: d*
T0
ó
Tshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*%
valueB"         @   
Þ
Sshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/meanConst*
_output_shapes
: *D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
valueB
 *    *
dtype0
à
Ushadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/stddevConst*
_output_shapes
: *D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
valueB
 *Ìá>*
dtype0
ä
^shadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalTshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/shape*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
seed2 *
dtype0*&
_output_shapes
:@*

seed 

Rshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/mulMul^shadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/TruncatedNormalUshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/stddev*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*&
_output_shapes
:@*
T0
õ
Nshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normalAddRshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/mulSshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal/mean*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*&
_output_shapes
:@
û
1shadow_net/feature_extraction_module/conv1/conv/W
VariableV2*
shared_name *D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
	container *
shape:@*
dtype0*&
_output_shapes
:@
å
8shadow_net/feature_extraction_module/conv1/conv/W/AssignAssign1shadow_net/feature_extraction_module/conv1/conv/WNshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
validate_shape(*&
_output_shapes
:@
ì
6shadow_net/feature_extraction_module/conv1/conv/W/readIdentity1shadow_net/feature_extraction_module/conv1/conv/W*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*&
_output_shapes
:@
Ö
Cshadow_net/feature_extraction_module/conv1/conv/b/Initializer/ConstConst*
dtype0*
_output_shapes
:@*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b*
valueB@*    
ã
1shadow_net/feature_extraction_module/conv1/conv/b
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b
Î
8shadow_net/feature_extraction_module/conv1/conv/b/AssignAssign1shadow_net/feature_extraction_module/conv1/conv/bCshadow_net/feature_extraction_module/conv1/conv/b/Initializer/Const*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0
à
6shadow_net/feature_extraction_module/conv1/conv/b/readIdentity1shadow_net/feature_extraction_module/conv1/conv/b*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b*
_output_shapes
:@
«
6shadow_net/feature_extraction_module/conv1/conv/Conv2DConv2Dshadow_net/truediv6shadow_net/feature_extraction_module/conv1/conv/W/read*
paddingSAME*&
_output_shapes
: d@*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(
ú
7shadow_net/feature_extraction_module/conv1/conv/BiasAddBiasAdd6shadow_net/feature_extraction_module/conv1/conv/Conv2D6shadow_net/feature_extraction_module/conv1/conv/b/read*
T0*
data_formatNHWC*&
_output_shapes
: d@
ª
4shadow_net/feature_extraction_module/conv1/conv/convIdentity7shadow_net/feature_extraction_module/conv1/conv/BiasAdd*
T0*&
_output_shapes
: d@
Ù
Dshadow_net/feature_extraction_module/conv1/bn/gamma/Initializer/onesConst*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma*
valueB@*  ?*
dtype0*
_output_shapes
:@
ç
3shadow_net/feature_extraction_module/conv1/bn/gamma
VariableV2*
shape:@*
dtype0*
_output_shapes
:@*
shared_name *F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma*
	container 
Õ
:shadow_net/feature_extraction_module/conv1/bn/gamma/AssignAssign3shadow_net/feature_extraction_module/conv1/bn/gammaDshadow_net/feature_extraction_module/conv1/bn/gamma/Initializer/ones*
_output_shapes
:@*
use_locking(*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma*
validate_shape(
æ
8shadow_net/feature_extraction_module/conv1/bn/gamma/readIdentity3shadow_net/feature_extraction_module/conv1/bn/gamma*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma*
_output_shapes
:@
Ø
Dshadow_net/feature_extraction_module/conv1/bn/beta/Initializer/zerosConst*
dtype0*
_output_shapes
:@*E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
valueB@*    
å
2shadow_net/feature_extraction_module/conv1/bn/beta
VariableV2*
dtype0*
_output_shapes
:@*
shared_name *E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
	container *
shape:@
Ò
9shadow_net/feature_extraction_module/conv1/bn/beta/AssignAssign2shadow_net/feature_extraction_module/conv1/bn/betaDshadow_net/feature_extraction_module/conv1/bn/beta/Initializer/zeros*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
validate_shape(*
_output_shapes
:@
ã
7shadow_net/feature_extraction_module/conv1/bn/beta/readIdentity2shadow_net/feature_extraction_module/conv1/bn/beta*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
_output_shapes
:@
æ
Kshadow_net/feature_extraction_module/conv1/bn/moving_mean/Initializer/zerosConst*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean*
valueB@*    *
dtype0*
_output_shapes
:@
ó
9shadow_net/feature_extraction_module/conv1/bn/moving_mean
VariableV2*
shape:@*
dtype0*
_output_shapes
:@*
shared_name *L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean*
	container 
î
@shadow_net/feature_extraction_module/conv1/bn/moving_mean/AssignAssign9shadow_net/feature_extraction_module/conv1/bn/moving_meanKshadow_net/feature_extraction_module/conv1/bn/moving_mean/Initializer/zeros*
use_locking(*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean*
validate_shape(*
_output_shapes
:@
ø
>shadow_net/feature_extraction_module/conv1/bn/moving_mean/readIdentity9shadow_net/feature_extraction_module/conv1/bn/moving_mean*
_output_shapes
:@*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean
í
Nshadow_net/feature_extraction_module/conv1/bn/moving_variance/Initializer/onesConst*
dtype0*
_output_shapes
:@*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance*
valueB@*  ?
û
=shadow_net/feature_extraction_module/conv1/bn/moving_variance
VariableV2*
	container *
shape:@*
dtype0*
_output_shapes
:@*
shared_name *P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance
ý
Dshadow_net/feature_extraction_module/conv1/bn/moving_variance/AssignAssign=shadow_net/feature_extraction_module/conv1/bn/moving_varianceNshadow_net/feature_extraction_module/conv1/bn/moving_variance/Initializer/ones*
use_locking(*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance*
validate_shape(*
_output_shapes
:@

Bshadow_net/feature_extraction_module/conv1/bn/moving_variance/readIdentity=shadow_net/feature_extraction_module/conv1/bn/moving_variance*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance*
_output_shapes
:@

<shadow_net/feature_extraction_module/conv1/bn/FusedBatchNormFusedBatchNorm4shadow_net/feature_extraction_module/conv1/conv/conv8shadow_net/feature_extraction_module/conv1/bn/gamma/read7shadow_net/feature_extraction_module/conv1/bn/beta/read>shadow_net/feature_extraction_module/conv1/bn/moving_mean/readBshadow_net/feature_extraction_module/conv1/bn/moving_variance/read*
epsilon%o:*
T0*
data_formatNHWC*>
_output_shapes,
*: d@:@:@:@:@*
is_training( 
x
3shadow_net/feature_extraction_module/conv1/bn/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 
¦
/shadow_net/feature_extraction_module/conv1/reluRelu<shadow_net/feature_extraction_module/conv1/bn/FusedBatchNorm*&
_output_shapes
: d@*
T0
ó
3shadow_net/feature_extraction_module/conv1/max_poolMaxPool/shadow_net/feature_extraction_module/conv1/relu*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingVALID*&
_output_shapes
:2@
ó
Tshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/shapeConst*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*%
valueB"      @      *
dtype0*
_output_shapes
:
Þ
Sshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/meanConst*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
valueB
 *    *
dtype0*
_output_shapes
: 
à
Ushadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/stddevConst*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
valueB
 *=*
dtype0*
_output_shapes
: 
å
^shadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalTshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/shape*'
_output_shapes
:@*

seed *
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
seed2 *
dtype0

Rshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/mulMul^shadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/TruncatedNormalUshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/stddev*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*'
_output_shapes
:@
ö
Nshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normalAddRshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/mulSshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal/mean*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*'
_output_shapes
:@*
T0
ý
1shadow_net/feature_extraction_module/conv2/conv/W
VariableV2*
shared_name *D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
	container *
shape:@*
dtype0*'
_output_shapes
:@
æ
8shadow_net/feature_extraction_module/conv2/conv/W/AssignAssign1shadow_net/feature_extraction_module/conv2/conv/WNshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
validate_shape(*'
_output_shapes
:@
í
6shadow_net/feature_extraction_module/conv2/conv/W/readIdentity1shadow_net/feature_extraction_module/conv2/conv/W*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*'
_output_shapes
:@
Ø
Cshadow_net/feature_extraction_module/conv2/conv/b/Initializer/ConstConst*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
valueB*    *
dtype0*
_output_shapes	
:
å
1shadow_net/feature_extraction_module/conv2/conv/b
VariableV2*
_output_shapes	
:*
shared_name *D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
	container *
shape:*
dtype0
Ï
8shadow_net/feature_extraction_module/conv2/conv/b/AssignAssign1shadow_net/feature_extraction_module/conv2/conv/bCshadow_net/feature_extraction_module/conv2/conv/b/Initializer/Const*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
validate_shape(*
_output_shapes	
:*
use_locking(
á
6shadow_net/feature_extraction_module/conv2/conv/b/readIdentity1shadow_net/feature_extraction_module/conv2/conv/b*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
_output_shapes	
:*
T0
Í
6shadow_net/feature_extraction_module/conv2/conv/Conv2DConv2D3shadow_net/feature_extraction_module/conv1/max_pool6shadow_net/feature_extraction_module/conv2/conv/W/read*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME*'
_output_shapes
:2*
	dilations

û
7shadow_net/feature_extraction_module/conv2/conv/BiasAddBiasAdd6shadow_net/feature_extraction_module/conv2/conv/Conv2D6shadow_net/feature_extraction_module/conv2/conv/b/read*'
_output_shapes
:2*
T0*
data_formatNHWC
«
4shadow_net/feature_extraction_module/conv2/conv/convIdentity7shadow_net/feature_extraction_module/conv2/conv/BiasAdd*
T0*'
_output_shapes
:2
Û
Dshadow_net/feature_extraction_module/conv2/bn/gamma/Initializer/onesConst*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
é
3shadow_net/feature_extraction_module/conv2/bn/gamma
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
	container *
shape:
Ö
:shadow_net/feature_extraction_module/conv2/bn/gamma/AssignAssign3shadow_net/feature_extraction_module/conv2/bn/gammaDshadow_net/feature_extraction_module/conv2/bn/gamma/Initializer/ones*
use_locking(*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
validate_shape(*
_output_shapes	
:
ç
8shadow_net/feature_extraction_module/conv2/bn/gamma/readIdentity3shadow_net/feature_extraction_module/conv2/bn/gamma*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
_output_shapes	
:
Ú
Dshadow_net/feature_extraction_module/conv2/bn/beta/Initializer/zerosConst*E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
valueB*    *
dtype0*
_output_shapes	
:
ç
2shadow_net/feature_extraction_module/conv2/bn/beta
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
	container *
shape:
Ó
9shadow_net/feature_extraction_module/conv2/bn/beta/AssignAssign2shadow_net/feature_extraction_module/conv2/bn/betaDshadow_net/feature_extraction_module/conv2/bn/beta/Initializer/zeros*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
validate_shape(*
_output_shapes	
:
ä
7shadow_net/feature_extraction_module/conv2/bn/beta/readIdentity2shadow_net/feature_extraction_module/conv2/bn/beta*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
_output_shapes	
:
è
Kshadow_net/feature_extraction_module/conv2/bn/moving_mean/Initializer/zerosConst*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
valueB*    *
dtype0*
_output_shapes	
:
õ
9shadow_net/feature_extraction_module/conv2/bn/moving_mean
VariableV2*
shared_name *L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
	container *
shape:*
dtype0*
_output_shapes	
:
ï
@shadow_net/feature_extraction_module/conv2/bn/moving_mean/AssignAssign9shadow_net/feature_extraction_module/conv2/bn/moving_meanKshadow_net/feature_extraction_module/conv2/bn/moving_mean/Initializer/zeros*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
ù
>shadow_net/feature_extraction_module/conv2/bn/moving_mean/readIdentity9shadow_net/feature_extraction_module/conv2/bn/moving_mean*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
_output_shapes	
:
ï
Nshadow_net/feature_extraction_module/conv2/bn/moving_variance/Initializer/onesConst*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
valueB*  ?*
dtype0*
_output_shapes	
:
ý
=shadow_net/feature_extraction_module/conv2/bn/moving_variance
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
	container *
shape:
þ
Dshadow_net/feature_extraction_module/conv2/bn/moving_variance/AssignAssign=shadow_net/feature_extraction_module/conv2/bn/moving_varianceNshadow_net/feature_extraction_module/conv2/bn/moving_variance/Initializer/ones*
use_locking(*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
validate_shape(*
_output_shapes	
:

Bshadow_net/feature_extraction_module/conv2/bn/moving_variance/readIdentity=shadow_net/feature_extraction_module/conv2/bn/moving_variance*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
_output_shapes	
:

<shadow_net/feature_extraction_module/conv2/bn/FusedBatchNormFusedBatchNorm4shadow_net/feature_extraction_module/conv2/conv/conv8shadow_net/feature_extraction_module/conv2/bn/gamma/read7shadow_net/feature_extraction_module/conv2/bn/beta/read>shadow_net/feature_extraction_module/conv2/bn/moving_mean/readBshadow_net/feature_extraction_module/conv2/bn/moving_variance/read*
epsilon%o:*
T0*
data_formatNHWC*C
_output_shapes1
/:2::::*
is_training( 
x
3shadow_net/feature_extraction_module/conv2/bn/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 
§
/shadow_net/feature_extraction_module/conv2/reluRelu<shadow_net/feature_extraction_module/conv2/bn/FusedBatchNorm*
T0*'
_output_shapes
:2
ô
3shadow_net/feature_extraction_module/conv2/max_poolMaxPool/shadow_net/feature_extraction_module/conv2/relu*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingVALID*'
_output_shapes
:
é
Oshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*%
valueB"            *
dtype0*
_output_shapes
:
Ô
Nshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/meanConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
valueB
 *    *
dtype0*
_output_shapes
: 
Ö
Pshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/stddevConst*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
valueB
 *B=*
dtype0
×
Yshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/shape*
seed2 *
dtype0*(
_output_shapes
:*

seed *
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W
õ
Mshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/mulMulYshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/TruncatedNormalPshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/stddev*(
_output_shapes
:*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W
ã
Ishadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normalAddMshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/mulNshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*(
_output_shapes
:
õ
,shadow_net/feature_extraction_module/conv3/W
VariableV2*
dtype0*(
_output_shapes
:*
shared_name *?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
	container *
shape:
Ó
3shadow_net/feature_extraction_module/conv3/W/AssignAssign,shadow_net/feature_extraction_module/conv3/WIshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
validate_shape(*(
_output_shapes
:*
use_locking(*
T0
ß
1shadow_net/feature_extraction_module/conv3/W/readIdentity,shadow_net/feature_extraction_module/conv3/W*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*(
_output_shapes
:
Ã
1shadow_net/feature_extraction_module/conv3/Conv2DConv2D3shadow_net/feature_extraction_module/conv2/max_pool1shadow_net/feature_extraction_module/conv3/W/read*'
_output_shapes
:*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME
¡
0shadow_net/feature_extraction_module/conv3/conv3Identity1shadow_net/feature_extraction_module/conv3/Conv2D*'
_output_shapes
:*
T0
Ñ
?shadow_net/feature_extraction_module/bn3/gamma/Initializer/onesConst*A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
ß
.shadow_net/feature_extraction_module/bn3/gamma
VariableV2*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name *A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma
Â
5shadow_net/feature_extraction_module/bn3/gamma/AssignAssign.shadow_net/feature_extraction_module/bn3/gamma?shadow_net/feature_extraction_module/bn3/gamma/Initializer/ones*
_output_shapes	
:*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma*
validate_shape(
Ø
3shadow_net/feature_extraction_module/bn3/gamma/readIdentity.shadow_net/feature_extraction_module/bn3/gamma*
_output_shapes	
:*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma
Ð
?shadow_net/feature_extraction_module/bn3/beta/Initializer/zerosConst*@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta*
valueB*    *
dtype0*
_output_shapes	
:
Ý
-shadow_net/feature_extraction_module/bn3/beta
VariableV2*
shared_name *@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta*
	container *
shape:*
dtype0*
_output_shapes	
:
¿
4shadow_net/feature_extraction_module/bn3/beta/AssignAssign-shadow_net/feature_extraction_module/bn3/beta?shadow_net/feature_extraction_module/bn3/beta/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta*
validate_shape(*
_output_shapes	
:
Õ
2shadow_net/feature_extraction_module/bn3/beta/readIdentity-shadow_net/feature_extraction_module/bn3/beta*@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta*
_output_shapes	
:*
T0
Þ
Fshadow_net/feature_extraction_module/bn3/moving_mean/Initializer/zerosConst*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
valueB*    *
dtype0*
_output_shapes	
:
ë
4shadow_net/feature_extraction_module/bn3/moving_mean
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
	container *
shape:
Û
;shadow_net/feature_extraction_module/bn3/moving_mean/AssignAssign4shadow_net/feature_extraction_module/bn3/moving_meanFshadow_net/feature_extraction_module/bn3/moving_mean/Initializer/zeros*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
validate_shape(*
_output_shapes	
:
ê
9shadow_net/feature_extraction_module/bn3/moving_mean/readIdentity4shadow_net/feature_extraction_module/bn3/moving_mean*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
_output_shapes	
:
å
Ishadow_net/feature_extraction_module/bn3/moving_variance/Initializer/onesConst*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
valueB*  ?*
dtype0*
_output_shapes	
:
ó
8shadow_net/feature_extraction_module/bn3/moving_variance
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
	container *
shape:
ê
?shadow_net/feature_extraction_module/bn3/moving_variance/AssignAssign8shadow_net/feature_extraction_module/bn3/moving_varianceIshadow_net/feature_extraction_module/bn3/moving_variance/Initializer/ones*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
validate_shape(*
_output_shapes	
:
ö
=shadow_net/feature_extraction_module/bn3/moving_variance/readIdentity8shadow_net/feature_extraction_module/bn3/moving_variance*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
_output_shapes	
:
è
7shadow_net/feature_extraction_module/bn3/FusedBatchNormFusedBatchNorm0shadow_net/feature_extraction_module/conv3/conv33shadow_net/feature_extraction_module/bn3/gamma/read2shadow_net/feature_extraction_module/bn3/beta/read9shadow_net/feature_extraction_module/bn3/moving_mean/read=shadow_net/feature_extraction_module/bn3/moving_variance/read*
T0*
data_formatNHWC*C
_output_shapes1
/:::::*
is_training( *
epsilon%o:
s
.shadow_net/feature_extraction_module/bn3/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

*shadow_net/feature_extraction_module/relu3Relu7shadow_net/feature_extraction_module/bn3/FusedBatchNorm*'
_output_shapes
:*
T0
é
Oshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*%
valueB"            *
dtype0*
_output_shapes
:
Ô
Nshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/meanConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
valueB
 *    *
dtype0*
_output_shapes
: 
Ö
Pshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
valueB
 *	=*
dtype0*
_output_shapes
: 
×
Yshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/shape*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
seed2 *
dtype0*(
_output_shapes
:*

seed 
õ
Mshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/mulMulYshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/TruncatedNormalPshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*(
_output_shapes
:
ã
Ishadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normalAddMshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/mulNshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*(
_output_shapes
:
õ
,shadow_net/feature_extraction_module/conv4/W
VariableV2*
shared_name *?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
	container *
shape:*
dtype0*(
_output_shapes
:
Ó
3shadow_net/feature_extraction_module/conv4/W/AssignAssign,shadow_net/feature_extraction_module/conv4/WIshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
validate_shape(*(
_output_shapes
:
ß
1shadow_net/feature_extraction_module/conv4/W/readIdentity,shadow_net/feature_extraction_module/conv4/W*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*(
_output_shapes
:
º
1shadow_net/feature_extraction_module/conv4/Conv2DConv2D*shadow_net/feature_extraction_module/relu31shadow_net/feature_extraction_module/conv4/W/read*'
_output_shapes
:*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingSAME
¡
0shadow_net/feature_extraction_module/conv4/conv4Identity1shadow_net/feature_extraction_module/conv4/Conv2D*
T0*'
_output_shapes
:
Ñ
?shadow_net/feature_extraction_module/bn4/gamma/Initializer/onesConst*A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
ß
.shadow_net/feature_extraction_module/bn4/gamma
VariableV2*
shared_name *A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
	container *
shape:*
dtype0*
_output_shapes	
:
Â
5shadow_net/feature_extraction_module/bn4/gamma/AssignAssign.shadow_net/feature_extraction_module/bn4/gamma?shadow_net/feature_extraction_module/bn4/gamma/Initializer/ones*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
validate_shape(*
_output_shapes	
:
Ø
3shadow_net/feature_extraction_module/bn4/gamma/readIdentity.shadow_net/feature_extraction_module/bn4/gamma*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
_output_shapes	
:
Ð
?shadow_net/feature_extraction_module/bn4/beta/Initializer/zerosConst*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta*
valueB*    *
dtype0*
_output_shapes	
:
Ý
-shadow_net/feature_extraction_module/bn4/beta
VariableV2*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
¿
4shadow_net/feature_extraction_module/bn4/beta/AssignAssign-shadow_net/feature_extraction_module/bn4/beta?shadow_net/feature_extraction_module/bn4/beta/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta*
validate_shape(*
_output_shapes	
:
Õ
2shadow_net/feature_extraction_module/bn4/beta/readIdentity-shadow_net/feature_extraction_module/bn4/beta*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta*
_output_shapes	
:
Þ
Fshadow_net/feature_extraction_module/bn4/moving_mean/Initializer/zerosConst*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
valueB*    *
dtype0*
_output_shapes	
:
ë
4shadow_net/feature_extraction_module/bn4/moving_mean
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
	container *
shape:
Û
;shadow_net/feature_extraction_module/bn4/moving_mean/AssignAssign4shadow_net/feature_extraction_module/bn4/moving_meanFshadow_net/feature_extraction_module/bn4/moving_mean/Initializer/zeros*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
validate_shape(*
_output_shapes	
:
ê
9shadow_net/feature_extraction_module/bn4/moving_mean/readIdentity4shadow_net/feature_extraction_module/bn4/moving_mean*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
_output_shapes	
:*
T0
å
Ishadow_net/feature_extraction_module/bn4/moving_variance/Initializer/onesConst*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
valueB*  ?*
dtype0*
_output_shapes	
:
ó
8shadow_net/feature_extraction_module/bn4/moving_variance
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
	container *
shape:
ê
?shadow_net/feature_extraction_module/bn4/moving_variance/AssignAssign8shadow_net/feature_extraction_module/bn4/moving_varianceIshadow_net/feature_extraction_module/bn4/moving_variance/Initializer/ones*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
validate_shape(*
_output_shapes	
:
ö
=shadow_net/feature_extraction_module/bn4/moving_variance/readIdentity8shadow_net/feature_extraction_module/bn4/moving_variance*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
_output_shapes	
:
è
7shadow_net/feature_extraction_module/bn4/FusedBatchNormFusedBatchNorm0shadow_net/feature_extraction_module/conv4/conv43shadow_net/feature_extraction_module/bn4/gamma/read2shadow_net/feature_extraction_module/bn4/beta/read9shadow_net/feature_extraction_module/bn4/moving_mean/read=shadow_net/feature_extraction_module/bn4/moving_variance/read*
data_formatNHWC*C
_output_shapes1
/:::::*
is_training( *
epsilon%o:*
T0
s
.shadow_net/feature_extraction_module/bn4/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

*shadow_net/feature_extraction_module/relu4Relu7shadow_net/feature_extraction_module/bn4/FusedBatchNorm*
T0*'
_output_shapes
:
ê
.shadow_net/feature_extraction_module/max_pool4MaxPool*shadow_net/feature_extraction_module/relu4*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingVALID*'
_output_shapes
:
é
Oshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*%
valueB"            *
dtype0*
_output_shapes
:
Ô
Nshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/meanConst*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
valueB
 *    *
dtype0
Ö
Pshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
valueB
 *	=
×
Yshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/shape*
dtype0*(
_output_shapes
:*

seed *
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
seed2 
õ
Mshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/mulMulYshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/TruncatedNormalPshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*(
_output_shapes
:
ã
Ishadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normalAddMshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/mulNshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal/mean*(
_output_shapes
:*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W
õ
,shadow_net/feature_extraction_module/conv5/W
VariableV2*
shared_name *?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
	container *
shape:*
dtype0*(
_output_shapes
:
Ó
3shadow_net/feature_extraction_module/conv5/W/AssignAssign,shadow_net/feature_extraction_module/conv5/WIshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal*(
_output_shapes
:*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
validate_shape(
ß
1shadow_net/feature_extraction_module/conv5/W/readIdentity,shadow_net/feature_extraction_module/conv5/W*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*(
_output_shapes
:
¾
1shadow_net/feature_extraction_module/conv5/Conv2DConv2D.shadow_net/feature_extraction_module/max_pool41shadow_net/feature_extraction_module/conv5/W/read*
paddingSAME*'
_output_shapes
:*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(
¡
0shadow_net/feature_extraction_module/conv5/conv5Identity1shadow_net/feature_extraction_module/conv5/Conv2D*'
_output_shapes
:*
T0
Ñ
?shadow_net/feature_extraction_module/bn5/gamma/Initializer/onesConst*A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
ß
.shadow_net/feature_extraction_module/bn5/gamma
VariableV2*
_output_shapes	
:*
shared_name *A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
	container *
shape:*
dtype0
Â
5shadow_net/feature_extraction_module/bn5/gamma/AssignAssign.shadow_net/feature_extraction_module/bn5/gamma?shadow_net/feature_extraction_module/bn5/gamma/Initializer/ones*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
validate_shape(*
_output_shapes	
:
Ø
3shadow_net/feature_extraction_module/bn5/gamma/readIdentity.shadow_net/feature_extraction_module/bn5/gamma*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
_output_shapes	
:
Ð
?shadow_net/feature_extraction_module/bn5/beta/Initializer/zerosConst*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
valueB*    *
dtype0*
_output_shapes	
:
Ý
-shadow_net/feature_extraction_module/bn5/beta
VariableV2*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
¿
4shadow_net/feature_extraction_module/bn5/beta/AssignAssign-shadow_net/feature_extraction_module/bn5/beta?shadow_net/feature_extraction_module/bn5/beta/Initializer/zeros*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
Õ
2shadow_net/feature_extraction_module/bn5/beta/readIdentity-shadow_net/feature_extraction_module/bn5/beta*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
_output_shapes	
:
Þ
Fshadow_net/feature_extraction_module/bn5/moving_mean/Initializer/zerosConst*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean*
valueB*    *
dtype0*
_output_shapes	
:
ë
4shadow_net/feature_extraction_module/bn5/moving_mean
VariableV2*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name *G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean
Û
;shadow_net/feature_extraction_module/bn5/moving_mean/AssignAssign4shadow_net/feature_extraction_module/bn5/moving_meanFshadow_net/feature_extraction_module/bn5/moving_mean/Initializer/zeros*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
ê
9shadow_net/feature_extraction_module/bn5/moving_mean/readIdentity4shadow_net/feature_extraction_module/bn5/moving_mean*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean*
_output_shapes	
:
å
Ishadow_net/feature_extraction_module/bn5/moving_variance/Initializer/onesConst*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance*
valueB*  ?*
dtype0*
_output_shapes	
:
ó
8shadow_net/feature_extraction_module/bn5/moving_variance
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance*
	container *
shape:
ê
?shadow_net/feature_extraction_module/bn5/moving_variance/AssignAssign8shadow_net/feature_extraction_module/bn5/moving_varianceIshadow_net/feature_extraction_module/bn5/moving_variance/Initializer/ones*
_output_shapes	
:*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance*
validate_shape(
ö
=shadow_net/feature_extraction_module/bn5/moving_variance/readIdentity8shadow_net/feature_extraction_module/bn5/moving_variance*
_output_shapes	
:*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance
è
7shadow_net/feature_extraction_module/bn5/FusedBatchNormFusedBatchNorm0shadow_net/feature_extraction_module/conv5/conv53shadow_net/feature_extraction_module/bn5/gamma/read2shadow_net/feature_extraction_module/bn5/beta/read9shadow_net/feature_extraction_module/bn5/moving_mean/read=shadow_net/feature_extraction_module/bn5/moving_variance/read*
epsilon%o:*
T0*
data_formatNHWC*C
_output_shapes1
/:::::*
is_training( 
s
.shadow_net/feature_extraction_module/bn5/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

*shadow_net/feature_extraction_module/bn5_1Relu7shadow_net/feature_extraction_module/bn5/FusedBatchNorm*
T0*'
_output_shapes
:
é
Oshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*%
valueB"            
Ô
Nshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
valueB
 *    
Ö
Pshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/stddevConst*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
valueB
 *Â<*
dtype0
×
Yshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/shape*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
seed2 *
dtype0*(
_output_shapes
:*

seed 
õ
Mshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/mulMulYshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/TruncatedNormalPshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*(
_output_shapes
:
ã
Ishadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normalAddMshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/mulNshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*(
_output_shapes
:
õ
,shadow_net/feature_extraction_module/conv6/W
VariableV2*(
_output_shapes
:*
shared_name *?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
	container *
shape:*
dtype0
Ó
3shadow_net/feature_extraction_module/conv6/W/AssignAssign,shadow_net/feature_extraction_module/conv6/WIshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
validate_shape(*(
_output_shapes
:*
use_locking(*
T0
ß
1shadow_net/feature_extraction_module/conv6/W/readIdentity,shadow_net/feature_extraction_module/conv6/W*(
_output_shapes
:*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W
º
1shadow_net/feature_extraction_module/conv6/Conv2DConv2D*shadow_net/feature_extraction_module/bn5_11shadow_net/feature_extraction_module/conv6/W/read*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(*
paddingSAME*'
_output_shapes
:*
	dilations
*
T0
¡
0shadow_net/feature_extraction_module/conv6/conv6Identity1shadow_net/feature_extraction_module/conv6/Conv2D*'
_output_shapes
:*
T0
Ñ
?shadow_net/feature_extraction_module/bn6/gamma/Initializer/onesConst*A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
ß
.shadow_net/feature_extraction_module/bn6/gamma
VariableV2*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name *A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma
Â
5shadow_net/feature_extraction_module/bn6/gamma/AssignAssign.shadow_net/feature_extraction_module/bn6/gamma?shadow_net/feature_extraction_module/bn6/gamma/Initializer/ones*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma*
validate_shape(*
_output_shapes	
:
Ø
3shadow_net/feature_extraction_module/bn6/gamma/readIdentity.shadow_net/feature_extraction_module/bn6/gamma*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma*
_output_shapes	
:
Ð
?shadow_net/feature_extraction_module/bn6/beta/Initializer/zerosConst*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
valueB*    *
dtype0*
_output_shapes	
:
Ý
-shadow_net/feature_extraction_module/bn6/beta
VariableV2*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
¿
4shadow_net/feature_extraction_module/bn6/beta/AssignAssign-shadow_net/feature_extraction_module/bn6/beta?shadow_net/feature_extraction_module/bn6/beta/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
validate_shape(*
_output_shapes	
:
Õ
2shadow_net/feature_extraction_module/bn6/beta/readIdentity-shadow_net/feature_extraction_module/bn6/beta*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
_output_shapes	
:
Þ
Fshadow_net/feature_extraction_module/bn6/moving_mean/Initializer/zerosConst*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean*
valueB*    *
dtype0*
_output_shapes	
:
ë
4shadow_net/feature_extraction_module/bn6/moving_mean
VariableV2*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
Û
;shadow_net/feature_extraction_module/bn6/moving_mean/AssignAssign4shadow_net/feature_extraction_module/bn6/moving_meanFshadow_net/feature_extraction_module/bn6/moving_mean/Initializer/zeros*
_output_shapes	
:*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean*
validate_shape(
ê
9shadow_net/feature_extraction_module/bn6/moving_mean/readIdentity4shadow_net/feature_extraction_module/bn6/moving_mean*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean*
_output_shapes	
:
å
Ishadow_net/feature_extraction_module/bn6/moving_variance/Initializer/onesConst*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
valueB*  ?*
dtype0*
_output_shapes	
:
ó
8shadow_net/feature_extraction_module/bn6/moving_variance
VariableV2*
shared_name *K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
	container *
shape:*
dtype0*
_output_shapes	
:
ê
?shadow_net/feature_extraction_module/bn6/moving_variance/AssignAssign8shadow_net/feature_extraction_module/bn6/moving_varianceIshadow_net/feature_extraction_module/bn6/moving_variance/Initializer/ones*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
validate_shape(*
_output_shapes	
:
ö
=shadow_net/feature_extraction_module/bn6/moving_variance/readIdentity8shadow_net/feature_extraction_module/bn6/moving_variance*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
_output_shapes	
:*
T0
è
7shadow_net/feature_extraction_module/bn6/FusedBatchNormFusedBatchNorm0shadow_net/feature_extraction_module/conv6/conv63shadow_net/feature_extraction_module/bn6/gamma/read2shadow_net/feature_extraction_module/bn6/beta/read9shadow_net/feature_extraction_module/bn6/moving_mean/read=shadow_net/feature_extraction_module/bn6/moving_variance/read*C
_output_shapes1
/:::::*
is_training( *
epsilon%o:*
T0*
data_formatNHWC
s
.shadow_net/feature_extraction_module/bn6/ConstConst*
valueB
 *w¾?*
dtype0*
_output_shapes
: 

*shadow_net/feature_extraction_module/relu6Relu7shadow_net/feature_extraction_module/bn6/FusedBatchNorm*'
_output_shapes
:*
T0
ê
.shadow_net/feature_extraction_module/max_pool6MaxPool*shadow_net/feature_extraction_module/relu6*'
_output_shapes
:*
T0*
strides
*
data_formatNHWC*
ksize
*
paddingVALID
é
Oshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*%
valueB"            *
dtype0*
_output_shapes
:
Ô
Nshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/meanConst*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
valueB
 *    *
dtype0*
_output_shapes
: 
Ö
Pshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
valueB
 *Eñ=
×
Yshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/shape*
dtype0*(
_output_shapes
:*

seed *
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
seed2 
õ
Mshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/mulMulYshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/TruncatedNormalPshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/stddev*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*(
_output_shapes
:*
T0
ã
Ishadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normalAddMshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/mulNshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*(
_output_shapes
:
õ
,shadow_net/feature_extraction_module/conv7/W
VariableV2*
shared_name *?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
	container *
shape:*
dtype0*(
_output_shapes
:
Ó
3shadow_net/feature_extraction_module/conv7/W/AssignAssign,shadow_net/feature_extraction_module/conv7/WIshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
validate_shape(*(
_output_shapes
:
ß
1shadow_net/feature_extraction_module/conv7/W/readIdentity,shadow_net/feature_extraction_module/conv7/W*(
_output_shapes
:*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W
¾
1shadow_net/feature_extraction_module/conv7/Conv2DConv2D.shadow_net/feature_extraction_module/max_pool61shadow_net/feature_extraction_module/conv7/W/read*
paddingSAME*'
_output_shapes
:*
	dilations
*
T0*
data_formatNHWC*
strides
*
use_cudnn_on_gpu(
¡
0shadow_net/feature_extraction_module/conv7/conv7Identity1shadow_net/feature_extraction_module/conv7/Conv2D*
T0*'
_output_shapes
:
Ñ
?shadow_net/feature_extraction_module/bn7/gamma/Initializer/onesConst*A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma*
valueB*  ?*
dtype0*
_output_shapes	
:
ß
.shadow_net/feature_extraction_module/bn7/gamma
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma*
	container *
shape:
Â
5shadow_net/feature_extraction_module/bn7/gamma/AssignAssign.shadow_net/feature_extraction_module/bn7/gamma?shadow_net/feature_extraction_module/bn7/gamma/Initializer/ones*
_output_shapes	
:*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma*
validate_shape(
Ø
3shadow_net/feature_extraction_module/bn7/gamma/readIdentity.shadow_net/feature_extraction_module/bn7/gamma*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma*
_output_shapes	
:
Ð
?shadow_net/feature_extraction_module/bn7/beta/Initializer/zerosConst*@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
valueB*    *
dtype0*
_output_shapes	
:
Ý
-shadow_net/feature_extraction_module/bn7/beta
VariableV2*
dtype0*
_output_shapes	
:*
shared_name *@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
	container *
shape:
¿
4shadow_net/feature_extraction_module/bn7/beta/AssignAssign-shadow_net/feature_extraction_module/bn7/beta?shadow_net/feature_extraction_module/bn7/beta/Initializer/zeros*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
Õ
2shadow_net/feature_extraction_module/bn7/beta/readIdentity-shadow_net/feature_extraction_module/bn7/beta*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
_output_shapes	
:
Þ
Fshadow_net/feature_extraction_module/bn7/moving_mean/Initializer/zerosConst*
dtype0*
_output_shapes	
:*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean*
valueB*    
ë
4shadow_net/feature_extraction_module/bn7/moving_mean
VariableV2*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 
Û
;shadow_net/feature_extraction_module/bn7/moving_mean/AssignAssign4shadow_net/feature_extraction_module/bn7/moving_meanFshadow_net/feature_extraction_module/bn7/moving_mean/Initializer/zeros*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
ê
9shadow_net/feature_extraction_module/bn7/moving_mean/readIdentity4shadow_net/feature_extraction_module/bn7/moving_mean*
_output_shapes	
:*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean
å
Ishadow_net/feature_extraction_module/bn7/moving_variance/Initializer/onesConst*
_output_shapes	
:*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
valueB*  ?*
dtype0
ó
8shadow_net/feature_extraction_module/bn7/moving_variance
VariableV2*
_output_shapes	
:*
shared_name *K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
	container *
shape:*
dtype0
ê
?shadow_net/feature_extraction_module/bn7/moving_variance/AssignAssign8shadow_net/feature_extraction_module/bn7/moving_varianceIshadow_net/feature_extraction_module/bn7/moving_variance/Initializer/ones*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
validate_shape(*
_output_shapes	
:
ö
=shadow_net/feature_extraction_module/bn7/moving_variance/readIdentity8shadow_net/feature_extraction_module/bn7/moving_variance*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
_output_shapes	
:
è
7shadow_net/feature_extraction_module/bn7/FusedBatchNormFusedBatchNorm0shadow_net/feature_extraction_module/conv7/conv73shadow_net/feature_extraction_module/bn7/gamma/read2shadow_net/feature_extraction_module/bn7/beta/read9shadow_net/feature_extraction_module/bn7/moving_mean/read=shadow_net/feature_extraction_module/bn7/moving_variance/read*
T0*
data_formatNHWC*C
_output_shapes1
/:::::*
is_training( *
epsilon%o:
s
.shadow_net/feature_extraction_module/bn7/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *w¾?

*shadow_net/feature_extraction_module/bn7_1Relu7shadow_net/feature_extraction_module/bn7/FusedBatchNorm*'
_output_shapes
:*
T0
¥
)shadow_net/map_to_sequence_module/squeezeSqueeze*shadow_net/feature_extraction_module/bn7_1*
T0*#
_output_shapes
:*
squeeze_dims


Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/RankConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range/startConst*
_output_shapes
: *
value	B :*
dtype0
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
®
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/rangeRangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range/startZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Rankashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range/delta*
_output_shapes
:*

Tidx0
¶
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
É
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concatConcatV2eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat/values_0[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/rangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
°
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/transpose	Transpose)shadow_net/map_to_sequence_module/squeeze\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat*#
_output_shapes
:*
Tperm0*
T0
·
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/ConstConst*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
µ
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Constoshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_1sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
¸
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zerosFillnshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concatsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros/Const*

index_type0*
_output_shapes
:	*
T0
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_3Const*
_output_shapes
:*
valueB:*
dtype0
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_4Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
·
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

pshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1ConcatV2oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_4oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_5ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
º
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1Fillpshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1/Const*
_output_shapes
:	*
T0*

index_type0
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_6Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
°
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
³
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
§
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_sliceStridedSlice[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Shapeishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stackkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stack_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
¥
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/ConstConst*
valueB:*
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Const_1Const*
dtype0*
_output_shapes
:*
valueB:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Å
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_1ConcatV2[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Const]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Const_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
¦
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/zeros/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
â
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/zerosFill^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_1ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/zeros/Const*
T0*

index_type0*
_output_shapes
:	

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/timeConst*
value	B : *
dtype0*
_output_shapes
: 
ð
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayTensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice*
identical_element_shapes(*
tensor_array_nameljshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	*
dynamic_size( *
clear_after_read(
ñ
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1TensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice*
tensor_array_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
Ã
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
Æ
|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

vshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_sliceStridedSlicenshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/Shape|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_1~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_2*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/rangeRangetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/startvshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slicetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/delta*
_output_shapes
:*

Tidx0
Û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/range_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/transposeeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1:1*
T0*r
_classh
fdloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/transpose*
_output_shapes
: 
¡
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ï
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/MaximumMaximum_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Maximum/xcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice*
T0*
_output_shapes
: 
Í
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/MinimumMinimumcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Maximum*
_output_shapes
: *
T0
¯
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/EnterEntermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/iteration_counter*
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context*
T0*
is_constant( *
parallel_iterations 

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_1EnterZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/time*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context*
T0

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_2Entercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray:1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
®
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_3Entermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
°
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_4Enteroshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
ä
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/MergeMergeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enterishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_1*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_2Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_2*
N*
_output_shapes
: : *
T0
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_3Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_3kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_3*
N*!
_output_shapes
:	: *
T0
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_4Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_4kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_4*
T0*
N*!
_output_shapes
:	: 
Ô
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LessLessashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Mergefshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less/Enter*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
Ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1Lesscshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1/Enter*
T0*
_output_shapes
: 

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1/EnterEnter]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Minimum*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
Ò
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LogicalAnd
LogicalAnd`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Lessbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1*
_output_shapes
: 
ð
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCondLoopCondfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LogicalAnd*
_output_shapes
: 
Î
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/SwitchSwitchashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Mergedshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond*
_output_shapes
: : *
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_1Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1*
_output_shapes
: : *
T0
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_2Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_2dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_2*
_output_shapes
: : 
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_3Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_3dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_3
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_4Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_4dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_4**
_output_shapes
:	:	
÷
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/IdentityIdentitydshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch:1*
T0*
_output_shapes
: 
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_1Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_1:1*
_output_shapes
: *
T0
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_2Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_2:1*
_output_shapes
: *
T0

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_3Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_3:1*
T0*
_output_shapes
:	

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_4Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_4:1*
_output_shapes
:	*
T0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ð
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/addAdddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add/y*
T0*
_output_shapes
: 

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3TensorArrayReadV3sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1*
_output_shapes
:	*
dtype0
¯
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1*
T0*
is_constant(*
parallel_iterations *
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
Û
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1Entershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context
Î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/shapeConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/minConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
valueB
 *m½*
dtype0*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/maxConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
valueB
 *m=*
dtype0*
_output_shapes
: 
î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/shape*

seed *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
seed2 *
dtype0* 
_output_shapes
:

­
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/subSubshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/maxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/min*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
_output_shapes
: *
T0
Á
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/mulMulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/sub*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel* 
_output_shapes
:

²
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniformAddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/mulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/min*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel* 
_output_shapes
:

Ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel
VariableV2*
shared_name *v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:

¥
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/AssignAssigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:


hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/readIdentitycshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel* 
_output_shapes
:
*
T0
Å
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
valueB:*
dtype0
´
yshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/ConstConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
ª
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zerosFillshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/shape_as_tensoryshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/Const*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*

index_type0*
_output_shapes	
:
Å
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias
VariableV2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/AssignAssignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biassshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/readIdentityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
T0*
_output_shapes	
:

qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axisConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_4qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axis*
T0*
N*
_output_shapes
:	*

Tidx0
¨
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMulMatMullshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concatrshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter*
T0*
_output_shapes
:	*
transpose_a( *
transpose_b( 
¹
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/EnterEnterhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/read*
parallel_iterations * 
_output_shapes
:
*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context*
T0*
is_constant(

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAddBiasAddlshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMulsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter*
data_formatNHWC*
_output_shapes
:	*
T0
³
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/EnterEnterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/read*
is_constant(*
parallel_iterations *
_output_shapes	
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context*
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/ConstConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
_output_shapes
: *
value	B :*
dtype0

ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dimConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
¶
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/splitSplitushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dimmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd*
T0*@
_output_shapes.
,:	:	:	:	*
	num_split

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ö
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/addAddmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add/y*
T0*
_output_shapes
:	

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/SigmoidSigmoidishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add*
_output_shapes
:	*
T0
ñ
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mulMulmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoidfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_3*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1Sigmoidkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split*
_output_shapes
:	*
T0

jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/TanhTanhmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:1*
_output_shapes
:	*
T0
ù
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh*
T0*
_output_shapes
:	
ô
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add_1Addishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mulkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2Sigmoidmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:3*
T0*
_output_shapes
:	

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1Tanhkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add_1*
T0*
_output_shapes
:	
û
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1*
_output_shapes
:	*
T0
û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_2*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray*
parallel_iterations *
is_constant(*
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ö
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1Addfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1/y*
T0*
_output_shapes
: 
ü
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIterationNextIteration_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_1NextIterationashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_2NextIterationshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_3NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add_1*
T0*
_output_shapes
:	

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_4NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2*
T0*
_output_shapes
:	
í
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/ExitExitbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch*
T0*
_output_shapes
: 
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_1Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_1*
T0*
_output_shapes
: 
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_2Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_2*
T0*
_output_shapes
: 
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_3Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_3*
T0*
_output_shapes
:	
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_4Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_4*
T0*
_output_shapes
:	
â
xshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArraybshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/range/startConst*
_output_shapes
: *t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray*
value	B : *
dtype0
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/range/deltaConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
þ
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/rangeRangershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/range/startxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArraySizeV3rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/range/delta*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

Tidx0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray

zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArraylshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/rangebshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray*
dtype0*#
_output_shapes
:*
element_shape:	
®
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Const_2Const*
_output_shapes
:*
valueB"      *
dtype0
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Const_3Const*
valueB:*
dtype0*
_output_shapes
:

\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
¶
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1Rangecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1/start\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Rank_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1/delta*
_output_shapes
:*

Tidx0
¸
gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ñ
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2ConcatV2gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2/values_0]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/range_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2/axis*
T0*
N*
_output_shapes
:*

Tidx0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/transpose_1	Transposezshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArrayGatherV3^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/concat_2*#
_output_shapes
:*
Tperm0*
T0
«
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/ReverseV2/axisConst*
valueB:*
dtype0*
_output_shapes
:
±
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/ReverseV2	ReverseV2)shadow_net/map_to_sequence_module/squeezeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/ReverseV2/axis*
T0*#
_output_shapes
:*

Tidx0

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/RankConst*
dtype0*
_output_shapes
: *
value	B :
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range/startConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
®
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/rangeRangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range/startZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Rankashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range/delta*
_output_shapes
:*

Tidx0
¶
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
É
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concatConcatV2eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat/values_0[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/rangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
ã
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/transpose	Transpose\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/ReverseV2\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat*
T0*#
_output_shapes
:*
Tperm0
·
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/ConstConst*
dtype0*
_output_shapes
:*
valueB:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
µ
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Constoshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_1sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat/axis*

Tidx0*
T0*
N*
_output_shapes
:
¸
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zerosFillnshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concatsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_3Const*
dtype0*
_output_shapes
:*
valueB:
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_4Const*
dtype0*
_output_shapes
:*
valueB:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
·
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

pshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1ConcatV2oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_4oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_5ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
º
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1Fillpshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_6Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_7Const*
dtype0*
_output_shapes
:*
valueB:
°
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
³
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
§
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_sliceStridedSlice[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Shapeishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stackkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stack_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
¥
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/ConstConst*
valueB:*
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Å
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_1ConcatV2[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Const]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Const_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
¦
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
â
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/zerosFill^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_1ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/zeros/Const*
_output_shapes
:	*
T0*

index_type0

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/timeConst*
value	B : *
dtype0*
_output_shapes
: 
ð
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayTensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice*
tensor_array_nameljshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	*
clear_after_read(*
dynamic_size( *
identical_element_shapes(
ñ
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1TensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice*
tensor_array_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
Ã
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
Æ
|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

vshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_sliceStridedSlicenshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/Shape|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_1~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_2*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/startConst*
_output_shapes
: *
value	B : *
dtype0
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/rangeRangetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/startvshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slicetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/delta*

Tidx0*
_output_shapes
:
Û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/range_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/transposeeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1:1*
_output_shapes
: *
T0*r
_classh
fdloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/transpose
¡
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ï
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/MaximumMaximum_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Maximum/xcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice*
T0*
_output_shapes
: 
Í
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/MinimumMinimumcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Maximum*
_output_shapes
: *
T0
¯
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/EnterEntermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/iteration_counter*
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant( *
parallel_iterations 

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_1EnterZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/time*
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant( *
parallel_iterations 

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_2Entercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray:1*
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant( *
parallel_iterations 
®
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_3Entermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context
°
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_4Enteroshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1*
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant( *
parallel_iterations 
ä
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/MergeMergeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enterishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_1*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_2Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_2*
_output_shapes
: : *
T0*
N
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_3Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_3kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_3*
N*!
_output_shapes
:	: *
T0
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_4Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_4kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_4*
T0*
N*!
_output_shapes
:	: 
Ô
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LessLessashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Mergefshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less/Enter*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0
Ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1Lesscshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1/Enter*
_output_shapes
: *
T0

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1/EnterEnter]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Minimum*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context
Ò
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LogicalAnd
LogicalAnd`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Lessbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1*
_output_shapes
: 
ð
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCondLoopCondfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LogicalAnd*
_output_shapes
: 
Î
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/SwitchSwitchashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Mergedshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge*
_output_shapes
: : 
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_1Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond*
_output_shapes
: : *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_2Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_2dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_2*
_output_shapes
: : 
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_3Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_3dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_3
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_4Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_4dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_4**
_output_shapes
:	:	*
T0
÷
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/IdentityIdentitydshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch:1*
T0*
_output_shapes
: 
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_1Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_1:1*
T0*
_output_shapes
: 
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_2Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_2:1*
_output_shapes
: *
T0

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_3Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_3:1*
_output_shapes
:	*
T0

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_4Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_4:1*
_output_shapes
:	*
T0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ð
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/addAdddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add/y*
_output_shapes
: *
T0

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3TensorArrayReadV3sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	
¯
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1*
T0*
is_constant(*
parallel_iterations *
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context
Û
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1Entershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context
Î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/shapeConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/minConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
valueB
 *m½*
dtype0*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/maxConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
valueB
 *m=*
dtype0*
_output_shapes
: 
î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/shape*
dtype0* 
_output_shapes
:
*

seed *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
seed2 
­
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/subSubshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/maxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/min*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
_output_shapes
: 
Á
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/mulMulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/sub*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel* 
_output_shapes
:

²
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniformAddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/mulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/min* 
_output_shapes
:
*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel
Ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel
VariableV2*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:
*
shared_name 
¥
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/AssignAssigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/readIdentitycshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
T0* 
_output_shapes
:

Å
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
´
yshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/ConstConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
ª
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zerosFillshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/shape_as_tensoryshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/Const*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*

index_type0*
_output_shapes	
:
Å
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias
VariableV2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:*
shared_name 

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/AssignAssignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biassshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/readIdentityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
T0*
_output_shapes	
:

qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axisConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_4qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axis*
N*
_output_shapes
:	*

Tidx0*
T0
¨
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMulMatMullshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concatrshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter*
T0*
_output_shapes
:	*
transpose_a( *
transpose_b( 
¹
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/EnterEnterhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/read*
is_constant(*
parallel_iterations * 
_output_shapes
:
*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAddBiasAddlshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMulsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter*
data_formatNHWC*
_output_shapes
:	*
T0
³
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/EnterEnterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/ConstConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dimConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
¶
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/splitSplitushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dimmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd*
T0*@
_output_shapes.
,:	:	:	:	*
	num_split

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ö
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/addAddmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add/y*
_output_shapes
:	*
T0

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/SigmoidSigmoidishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add*
_output_shapes
:	*
T0
ñ
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mulMulmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoidfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_3*
T0*
_output_shapes
:	

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1Sigmoidkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split*
_output_shapes
:	*
T0

jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/TanhTanhmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:1*
_output_shapes
:	*
T0
ù
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh*
T0*
_output_shapes
:	
ô
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add_1Addishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mulkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2Sigmoidmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:3*
T0*
_output_shapes
:	

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1Tanhkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add_1*
_output_shapes
:	*
T0
û
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1*
T0*
_output_shapes
:	
û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_2*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
parallel_iterations *
is_constant(

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ö
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1Addfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1/y*
T0*
_output_shapes
: 
ü
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIterationNextIteration_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_1NextIterationashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_2NextIterationshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_3NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add_1*
_output_shapes
:	*
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_4NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
T0*
_output_shapes
:	
í
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/ExitExitbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch*
T0*
_output_shapes
: 
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_1Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_1*
_output_shapes
: *
T0
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_2Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_2*
_output_shapes
: *
T0
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_3Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_3*
T0*
_output_shapes
:	
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_4Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_4*
T0*
_output_shapes
:	
â
xshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArraybshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/range/startConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/range/deltaConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
þ
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/rangeRangershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/range/startxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArraySizeV3rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/range/delta*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

Tidx0

zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArraylshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/rangebshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_2*
element_shape:	*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray*
dtype0*#
_output_shapes
:
®
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Const_2Const*
valueB"      *
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Const_3Const*
valueB:*
dtype0*
_output_shapes
:

\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
¶
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1Rangecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1/start\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Rank_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1/delta*
_output_shapes
:*

Tidx0
¸
gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ñ
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2ConcatV2gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2/values_0]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/range_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2/axis*
T0*
N*
_output_shapes
:*

Tidx0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/transpose_1	Transposezshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArrayGatherV3^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/concat_2*#
_output_shapes
:*
Tperm0*
T0

Lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/ReverseV2/axisConst*
valueB:*
dtype0*
_output_shapes
:
¿
Gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/ReverseV2	ReverseV2ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/transpose_1Lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/ReverseV2/axis*#
_output_shapes
:*

Tidx0*
T0

Ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/concat/axisConst*
value	B :*
dtype0*
_output_shapes
: 

Dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/concatConcatV2ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/transpose_1Gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/ReverseV2Ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/concat/axis*
N*#
_output_shapes
:*

Tidx0*
T0

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/RankConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range/startConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
®
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/rangeRangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range/startZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Rankashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range/delta*
_output_shapes
:*

Tidx0
¶
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
É
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concatConcatV2eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat/values_0[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/rangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
Ë
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/transpose	TransposeDshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/concat\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat*
T0*#
_output_shapes
:*
Tperm0
·
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/ConstConst*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_1Const*
dtype0*
_output_shapes
:*
valueB:
µ
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Constoshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_1sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
¸
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zerosFillnshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concatsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_4Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
·
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

pshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1ConcatV2oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_4oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_5ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
º
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1Fillpshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/concat_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1/Const*
T0*

index_type0*
_output_shapes
:	
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_6Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/Const_7Const*
valueB:*
dtype0*
_output_shapes
:
°
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
³
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
§
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_sliceStridedSlice[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Shapeishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stackkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stack_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice/stack_2*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
¥
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/ConstConst*
valueB:*
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Å
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_1ConcatV2[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Const]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Const_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
¦
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
â
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/zerosFill^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_1ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/zeros/Const*
T0*

index_type0*
_output_shapes
:	

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/timeConst*
_output_shapes
: *
value	B : *
dtype0
ð
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayTensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice*
tensor_array_nameljshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
ñ
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1TensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice*
dynamic_size( *
clear_after_read(*
identical_element_shapes(*
tensor_array_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	
Ã
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/ShapeConst*
dtype0*
_output_shapes
:*!
valueB"         
Æ
|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

vshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_sliceStridedSlicenshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/Shape|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_1~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/rangeRangetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/startvshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/strided_slicetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/range/delta*
_output_shapes
:*

Tidx0
Û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/range_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/transposeeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1:1*
T0*r
_classh
fdloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/transpose*
_output_shapes
: 
¡
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ï
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/MaximumMaximum_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Maximum/xcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice*
T0*
_output_shapes
: 
Í
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/MinimumMinimumcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Maximum*
T0*
_output_shapes
: 
¯
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/iteration_counterConst*
dtype0*
_output_shapes
: *
value	B : 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/EnterEntermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/iteration_counter*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_1EnterZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/time*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_2Entercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray:1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context
®
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_3Entermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context
°
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_4Enteroshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/LSTMCellZeroState/zeros_1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context
ä
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/MergeMergeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enterishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_1*
N*
_output_shapes
: : *
T0
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_2Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_2*
T0*
N*
_output_shapes
: : 
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_3Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_3kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_3*
N*!
_output_shapes
:	: *
T0
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_4Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_4kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_4*
T0*
N*!
_output_shapes
:	: 
Ô
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LessLessashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Mergefshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less/Enter*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context*
T0
Ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1Lesscshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1/Enter*
T0*
_output_shapes
: 

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1/EnterEnter]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Minimum*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context
Ò
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LogicalAnd
LogicalAnd`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Lessbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1*
_output_shapes
: 
ð
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCondLoopCondfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LogicalAnd*
_output_shapes
: 
Î
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/SwitchSwitchashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Mergedshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond*
_output_shapes
: : *
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_1Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1*
_output_shapes
: : 
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_2Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_2dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_2*
_output_shapes
: : 
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_3Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_3dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_3
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_4Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_4dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_4
÷
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/IdentityIdentitydshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch:1*
_output_shapes
: *
T0
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_1Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_1:1*
T0*
_output_shapes
: 
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_2Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_2:1*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_3Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_3:1*
_output_shapes
:	*
T0

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_4Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_4:1*
T0*
_output_shapes
:	

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ð
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/addAdddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add/y*
_output_shapes
: *
T0

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3TensorArrayReadV3sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	
¯
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1*
T0*
is_constant(*
parallel_iterations *
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context
Û
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1Entershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context*
T0*
is_constant(
Î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
valueB"      
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
valueB
 *m½
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/maxConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
valueB
 *m=*
dtype0*
_output_shapes
: 
î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/shape*

seed *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
seed2 *
dtype0* 
_output_shapes
:

­
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/subSubshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/maxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/min*
_output_shapes
: *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel
Á
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/mulMulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/sub*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel* 
_output_shapes
:

²
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniformAddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/mulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform/min*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel* 
_output_shapes
:

Ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel
VariableV2*
shared_name *v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:

¥
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/AssignAssigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform* 
_output_shapes
:
*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
validate_shape(

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/readIdentitycshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel*
T0* 
_output_shapes
:

Å
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
valueB:*
dtype0*
_output_shapes
:
´
yshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/ConstConst*
_output_shapes
: *t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
valueB
 *    *
dtype0
ª
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zerosFillshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/shape_as_tensoryshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros/Const*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*

index_type0*
_output_shapes	
:
Å
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias
VariableV2*
shape:*
dtype0*
_output_shapes	
:*
shared_name *t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
	container 

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/AssignAssignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biassshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/readIdentityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
T0*
_output_shapes	
:

qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axisConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_4qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axis*
T0*
N*
_output_shapes
:	*

Tidx0
¨
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMulMatMullshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concatrshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter*
T0*
_output_shapes
:	*
transpose_a( *
transpose_b( 
¹
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/EnterEnterhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/read*
parallel_iterations * 
_output_shapes
:
*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context*
T0*
is_constant(

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAddBiasAddlshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMulsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	
³
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/EnterEnterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/ConstConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
dtype0*
_output_shapes
: *
value	B :

ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dimConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
¶
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/splitSplitushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dimmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd*
T0*@
_output_shapes.
,:	:	:	:	*
	num_split

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ö
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/addAddmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add/y*
T0*
_output_shapes
:	

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/SigmoidSigmoidishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add*
T0*
_output_shapes
:	
ñ
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mulMulmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoidfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_3*
T0*
_output_shapes
:	

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1Sigmoidkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split*
_output_shapes
:	*
T0

jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/TanhTanhmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:1*
T0*
_output_shapes
:	
ù
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh*
_output_shapes
:	*
T0
ô
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add_1Addishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mulkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2Sigmoidmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:3*
T0*
_output_shapes
:	

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1Tanhkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add_1*
_output_shapes
:	*
T0
û
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1*
T0*
_output_shapes
:	
û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_2*
_output_shapes
: *
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*
is_constant(*
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2*
parallel_iterations 

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ö
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1Addfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1/y*
_output_shapes
: *
T0
ü
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIterationNextIteration_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_1NextIterationashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_2NextIterationshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_3NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add_1*
T0*
_output_shapes
:	

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_4NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2*
T0*
_output_shapes
:	
í
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/ExitExitbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch*
_output_shapes
: *
T0
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_1Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_1*
_output_shapes
: *
T0
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_2Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_2*
T0*
_output_shapes
: 
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_3Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_3*
_output_shapes
:	*
T0
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_4Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_4*
T0*
_output_shapes
:	
â
xshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArraybshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/range/startConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/range/deltaConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
þ
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/rangeRangershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/range/startxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArraySizeV3rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/range/delta*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

Tidx0

zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArraylshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/rangebshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_2*
element_shape:	*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray*
dtype0*#
_output_shapes
:
®
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Const_2Const*
valueB"      *
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Const_3Const*
valueB:*
dtype0*
_output_shapes
:

\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
¶
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1Rangecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1/start\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Rank_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1/delta*
_output_shapes
:*

Tidx0
¸
gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2/values_0Const*
_output_shapes
:*
valueB"       *
dtype0
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ñ
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2ConcatV2gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2/values_0]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/range_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2/axis*
T0*
N*
_output_shapes
:*

Tidx0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/transpose_1	Transposezshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayStack/TensorArrayGatherV3^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/concat_2*
T0*#
_output_shapes
:*
Tperm0
«
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/ReverseV2/axisConst*
valueB:*
dtype0*
_output_shapes
:
Ì
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/ReverseV2	ReverseV2Dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/concatashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/ReverseV2/axis*

Tidx0*
T0*#
_output_shapes
:

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/RankConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range/startConst*
value	B :*
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0
®
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/rangeRangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range/startZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Rankashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range/delta*
_output_shapes
:*

Tidx0
¶
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
É
\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concatConcatV2eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat/values_0[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/rangeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
ã
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/transpose	Transpose\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/ReverseV2\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat*#
_output_shapes
:*
Tperm0*
T0
·
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/ConstConst*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_1Const*
_output_shapes
:*
valueB:*
dtype0
µ
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Constoshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_1sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat/axis*
T0*
N*
_output_shapes
:*

Tidx0
¸
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zerosFillnshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concatsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros/Const*
T0*

index_type0*
_output_shapes
:	
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_2Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_3Const*
valueB:*
dtype0*
_output_shapes
:
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_4Const*
_output_shapes
:*
valueB:*
dtype0
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_5Const*
valueB:*
dtype0*
_output_shapes
:
·
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 

pshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1ConcatV2oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_4oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_5ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1/axis*
T0*
N*
_output_shapes
:*

Tidx0
º
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1Fillpshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/concat_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1/Const*
_output_shapes
:	*
T0*

index_type0
¹
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_6Const*
valueB:*
dtype0*
_output_shapes
:
º
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/Const_7Const*
_output_shapes
:*
valueB:*
dtype0
°
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
³
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
µ
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
§
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_sliceStridedSlice[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Shapeishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stackkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stack_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice/stack_2*
Index0*
T0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
¥
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/ConstConst*
valueB:*
dtype0*
_output_shapes
:
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Const_1Const*
valueB:*
dtype0*
_output_shapes
:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_1/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Å
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_1ConcatV2[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Const]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Const_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_1/axis*

Tidx0*
T0*
N*
_output_shapes
:
¦
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
â
[shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/zerosFill^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_1ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/zeros/Const*
_output_shapes
:	*
T0*

index_type0

Zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/timeConst*
dtype0*
_output_shapes
: *
value	B : 
ð
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayTensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice*
tensor_array_nameljshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/dynamic_rnn/output_0*
dtype0*
_output_shapes

:: *
element_shape:	*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
ñ
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1TensorArrayV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice*
tensor_array_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/dynamic_rnn/input_0*
dtype0*
_output_shapes

:: *
element_shape:	*
dynamic_size( *
clear_after_read(*
identical_element_shapes(
Ã
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/ShapeConst*!
valueB"         *
dtype0*
_output_shapes
:
Æ
|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
È
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

vshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_sliceStridedSlicenshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/Shape|shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_1~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slice/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
¶
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/deltaConst*
_output_shapes
: *
value	B :*
dtype0

nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/rangeRangetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/startvshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/strided_slicetshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/range/delta*
_output_shapes
:*

Tidx0
Û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3TensorArrayScatterV3cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/range_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/transposeeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1:1*
_output_shapes
: *
T0*r
_classh
fdloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/transpose
¡
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Maximum/xConst*
value	B :*
dtype0*
_output_shapes
: 
Ï
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/MaximumMaximum_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Maximum/xcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice*
T0*
_output_shapes
: 
Í
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/MinimumMinimumcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Maximum*
_output_shapes
: *
T0
¯
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/iteration_counterConst*
value	B : *
dtype0*
_output_shapes
: 
£
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/EnterEntermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/iteration_counter*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context*
T0

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_1EnterZshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/time*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_2Entercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray:1*
T0*
is_constant( *
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context
®
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_3Entermshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros*
T0*
is_constant( *
parallel_iterations *
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context
°
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_4Enteroshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/LSTMCellZeroState/zeros_1*
_output_shapes
:	*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant( *
parallel_iterations 
ä
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/MergeMergeashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enterishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration*
T0*
N*
_output_shapes
: : 
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_1*
T0*
N*
_output_shapes
: : 
ê
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_2Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_2*
N*
_output_shapes
: : *
T0
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_3Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_3kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_3*
T0*
N*!
_output_shapes
:	: 
ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_4Mergecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_4kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_4*
N*!
_output_shapes
:	: *
T0
Ô
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LessLessashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Mergefshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less/Enter*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice*
T0*
is_constant(*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context
Ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1Lesscshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1/Enter*
_output_shapes
: *
T0

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1/EnterEnter]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Minimum*
parallel_iterations *
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant(
Ò
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LogicalAnd
LogicalAnd`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Lessbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1*
_output_shapes
: 
ð
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCondLoopCondfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LogicalAnd*
_output_shapes
: 
Î
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/SwitchSwitchashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Mergedshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge*
_output_shapes
: : 
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_1Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1*
_output_shapes
: : 
Ô
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_2Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_2dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_2*
_output_shapes
: : 
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_3Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_3dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_3
æ
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_4Switchcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_4dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond**
_output_shapes
:	:	*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_4
÷
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/IdentityIdentitydshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch:1*
_output_shapes
: *
T0
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_1Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_1:1*
_output_shapes
: *
T0
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_2Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_2:1*
T0*
_output_shapes
: 

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_3Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_3:1*
T0*
_output_shapes
:	

fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_4Identityfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_4:1*
T0*
_output_shapes
:	

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
_output_shapes
: *
value	B :*
dtype0
Ð
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/addAdddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add/y*
T0*
_output_shapes
: 

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3TensorArrayReadV3sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_1ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1*
dtype0*
_output_shapes
:	
¯
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/EnterEntercshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1*
T0*
is_constant(*
parallel_iterations *
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context
Û
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1Entershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3*
_output_shapes
: *y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context*
T0*
is_constant(*
parallel_iterations 
Î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/shapeConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
valueB"      *
dtype0*
_output_shapes
:
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/minConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
valueB
 *m½*
dtype0*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/maxConst*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
valueB
 *m=*
dtype0*
_output_shapes
: 
î
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformRandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/shape* 
_output_shapes
:
*

seed *
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
seed2 *
dtype0
­
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/subSubshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/maxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/min*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
_output_shapes
: *
T0
Á
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/mulMulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/RandomUniformshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/sub*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel* 
_output_shapes
:
*
T0
²
~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniformAddshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/mulshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform/min*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel* 
_output_shapes
:

Ó
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel
VariableV2*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
	container *
shape:
*
dtype0* 
_output_shapes
:
*
shared_name 
¥
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/AssignAssigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel~shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:


hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/readIdentitycshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
T0* 
_output_shapes
:

Å
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/shape_as_tensorConst*
_output_shapes
:*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
valueB:*
dtype0
´
yshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/ConstConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
valueB
 *    *
dtype0*
_output_shapes
: 
ª
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zerosFillshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/shape_as_tensoryshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros/Const*
_output_shapes	
:*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*

index_type0
Å
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias
VariableV2*
shared_name *t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
	container *
shape:*
dtype0*
_output_shapes	
:

hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/AssignAssignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biassshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros*
_output_shapes	
:*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
validate_shape(
û
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/readIdentityashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
T0*
_output_shapes	
:

qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axisConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concatConcatV2mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_4qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axis*
T0*
N*
_output_shapes
:	*

Tidx0
¨
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMulMatMullshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concatrshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter*
_output_shapes
:	*
transpose_a( *
transpose_b( *
T0
¹
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/EnterEnterhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/read*
T0*
is_constant(*
parallel_iterations * 
_output_shapes
:
*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAddBiasAddlshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMulsshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter*
T0*
data_formatNHWC*
_output_shapes
:	
³
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/EnterEnterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/read*
T0*
is_constant(*
parallel_iterations *
_output_shapes	
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/ConstConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 

ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dimConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
dtype0*
_output_shapes
: *
value	B :
¶
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/splitSplitushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dimmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd*
T0*@
_output_shapes.
,:	:	:	:	*
	num_split

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ö
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/addAddmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:2kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add/y*
_output_shapes
:	*
T0

mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/SigmoidSigmoidishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add*
_output_shapes
:	*
T0
ñ
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mulMulmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoidfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_3*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1Sigmoidkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split*
T0*
_output_shapes
:	

jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/TanhTanhmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:1*
_output_shapes
:	*
T0
ù
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh*
T0*
_output_shapes
:	
ô
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add_1Addishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mulkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1*
_output_shapes
:	*
T0

oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2Sigmoidmshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:3*
T0*
_output_shapes
:	

lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1Tanhkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add_1*
T0*
_output_shapes
:	
û
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2Muloshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1*
T0*
_output_shapes
:	
û
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3TensorArrayWriteV3shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enterfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_1kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_2*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
_output_shapes
: 
À
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/EnterEnterashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*
is_constant(*
_output_shapes
:*y

frame_namekishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context*
T0*~
_classt
rploc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
parallel_iterations 

cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1/yConste^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity*
value	B :*
dtype0*
_output_shapes
: 
Ö
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1Addfshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1/y*
_output_shapes
: *
T0
ü
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIterationNextIteration_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add*
T0*
_output_shapes
: 

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_1NextIterationashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_2NextIterationshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3*
_output_shapes
: *
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_3NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add_1*
_output_shapes
:	*
T0

kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_4NextIterationkshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2*
_output_shapes
:	*
T0
í
`shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/ExitExitbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch*
T0*
_output_shapes
: 
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_1Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_1*
_output_shapes
: *
T0
ñ
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_2Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_2*
_output_shapes
: *
T0
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_3Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_3*
_output_shapes
:	*
T0
ú
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_4Exitdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_4*
_output_shapes
:	*
T0
â
xshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArraySizeV3TensorArraySizeV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArraybshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_2*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/range/startConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*
value	B : *
dtype0*
_output_shapes
: 
ª
rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/range/deltaConst*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*
value	B :*
dtype0*
_output_shapes
: 
þ
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/rangeRangershadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/range/startxshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArraySizeV3rshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/range/delta*

Tidx0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

zshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArrayGatherV3TensorArrayGatherV3ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArraylshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/rangebshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_2*#
_output_shapes
:*
element_shape:	*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray*
dtype0
®
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Const_2Const*
dtype0*
_output_shapes
:*
valueB"      
¨
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Const_3Const*
valueB:*
dtype0*
_output_shapes
:

\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Rank_1Const*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1/startConst*
value	B :*
dtype0*
_output_shapes
: 
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
¶
]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1Rangecshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1/start\shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Rank_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1/delta*
_output_shapes
:*

Tidx0
¸
gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2/values_0Const*
valueB"       *
dtype0*
_output_shapes
:
¥
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Ñ
^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2ConcatV2gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2/values_0]shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/range_1cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2/axis*
T0*
N*
_output_shapes
:*

Tidx0

ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/transpose_1	Transposezshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayStack/TensorArrayGatherV3^shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/concat_2*#
_output_shapes
:*
Tperm0*
T0

Lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/ReverseV2/axisConst*
valueB:*
dtype0*
_output_shapes
:
¿
Gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/ReverseV2	ReverseV2ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/transpose_1Lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/ReverseV2/axis*
T0*#
_output_shapes
:*

Tidx0

Ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat/axisConst*
_output_shapes
: *
value	B :*
dtype0

Dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concatConcatV2ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/transpose_1Gshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/ReverseV2Ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat/axis*

Tidx0*
T0*
N*#
_output_shapes
:
r
7shadow_net/sequence_rnn_module/sequence_drop_out/SwitchSwitchEqualEqual*
T0
*
_output_shapes
: : 
¡
9shadow_net/sequence_rnn_module/sequence_drop_out/switch_tIdentity9shadow_net/sequence_rnn_module/sequence_drop_out/Switch:1*
T0
*
_output_shapes
: 

9shadow_net/sequence_rnn_module/sequence_drop_out/switch_fIdentity7shadow_net/sequence_rnn_module/sequence_drop_out/Switch*
_output_shapes
: *
T0

l
8shadow_net/sequence_rnn_module/sequence_drop_out/pred_idIdentityEqual*
_output_shapes
: *
T0

Ã
Bshadow_net/sequence_rnn_module/sequence_drop_out/dropout/keep_probConst:^shadow_net/sequence_rnn_module/sequence_drop_out/switch_t*
_output_shapes
: *
valueB
 *   ?*
dtype0
Ï
>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/ShapeConst:^shadow_net/sequence_rnn_module/sequence_drop_out/switch_t*!
valueB"         *
dtype0*
_output_shapes
:
Ì
Kshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/minConst:^shadow_net/sequence_rnn_module/sequence_drop_out/switch_t*
dtype0*
_output_shapes
: *
valueB
 *    
Ì
Kshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/maxConst:^shadow_net/sequence_rnn_module/sequence_drop_out/switch_t*
valueB
 *  ?*
dtype0*
_output_shapes
: 
ú
Ushadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/RandomUniformRandomUniform>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/Shape*#
_output_shapes
:*
seed2 *

seed *
T0*
dtype0

Kshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/subSubKshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/maxKshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/min*
T0*
_output_shapes
: 
¤
Kshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/mulMulUshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/RandomUniformKshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/sub*
T0*#
_output_shapes
:

Gshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniformAddKshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/mulKshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/min*#
_output_shapes
:*
T0
þ
<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/addAddBshadow_net/sequence_rnn_module/sequence_drop_out/dropout/keep_probGshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform*#
_output_shapes
:*
T0
³
>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/FloorFloor<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/add*
T0*#
_output_shapes
:

<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/divRealDivEshadow_net/sequence_rnn_module/sequence_drop_out/dropout/div/Switch:1Bshadow_net/sequence_rnn_module/sequence_drop_out/dropout/keep_prob*#
_output_shapes
:*
T0
ã
Cshadow_net/sequence_rnn_module/sequence_drop_out/dropout/div/SwitchSwitchDshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat8shadow_net/sequence_rnn_module/sequence_drop_out/pred_id*
T0*W
_classM
KIloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat*2
_output_shapes 
::
ï
<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/mulMul<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/div>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/Floor*
T0*#
_output_shapes
:
Ù
9shadow_net/sequence_rnn_module/sequence_drop_out/Switch_1SwitchDshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat8shadow_net/sequence_rnn_module/sequence_drop_out/pred_id*2
_output_shapes 
::*
T0*W
_classM
KIloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat
ñ
6shadow_net/sequence_rnn_module/sequence_drop_out/MergeMerge9shadow_net/sequence_rnn_module/sequence_drop_out/Switch_1<shadow_net/sequence_rnn_module/sequence_drop_out/dropout/mul*
T0*
N*%
_output_shapes
:: 
y
$shadow_net/sequence_rnn_module/ShapeConst*
_output_shapes
:*!
valueB"         *
dtype0
|
2shadow_net/sequence_rnn_module/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
~
4shadow_net/sequence_rnn_module/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
~
4shadow_net/sequence_rnn_module/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

,shadow_net/sequence_rnn_module/strided_sliceStridedSlice$shadow_net/sequence_rnn_module/Shape2shadow_net/sequence_rnn_module/strided_slice/stack4shadow_net/sequence_rnn_module/strided_slice/stack_14shadow_net/sequence_rnn_module/strided_slice/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
~
4shadow_net/sequence_rnn_module/strided_slice_1/stackConst*
valueB:*
dtype0*
_output_shapes
:

6shadow_net/sequence_rnn_module/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0

6shadow_net/sequence_rnn_module/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:

.shadow_net/sequence_rnn_module/strided_slice_1StridedSlice$shadow_net/sequence_rnn_module/Shape4shadow_net/sequence_rnn_module/strided_slice_1/stack6shadow_net/sequence_rnn_module/strided_slice_1/stack_16shadow_net/sequence_rnn_module/strided_slice_1/stack_2*
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
¨
"shadow_net/sequence_rnn_module/mulMul,shadow_net/sequence_rnn_module/strided_slice.shadow_net/sequence_rnn_module/strided_slice_1*
_output_shapes
: *
T0
~
4shadow_net/sequence_rnn_module/strided_slice_2/stackConst*
valueB:*
dtype0*
_output_shapes
:

6shadow_net/sequence_rnn_module/strided_slice_2/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

6shadow_net/sequence_rnn_module/strided_slice_2/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

.shadow_net/sequence_rnn_module/strided_slice_2StridedSlice$shadow_net/sequence_rnn_module/Shape4shadow_net/sequence_rnn_module/strided_slice_2/stack6shadow_net/sequence_rnn_module/strided_slice_2/stack_16shadow_net/sequence_rnn_module/strided_slice_2/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*
ellipsis_mask *

begin_mask 
Â
,shadow_net/sequence_rnn_module/Reshape/shapePack"shadow_net/sequence_rnn_module/mul.shadow_net/sequence_rnn_module/strided_slice_2*
_output_shapes
:*
T0*

axis *
N
Ï
&shadow_net/sequence_rnn_module/ReshapeReshape6shadow_net/sequence_rnn_module/sequence_drop_out/Merge,shadow_net/sequence_rnn_module/Reshape/shape*
_output_shapes
:	*
T0*
Tshape0
É
Cshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/shapeConst*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
valueB"   %   *
dtype0*
_output_shapes
:
¼
Bshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/meanConst*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
valueB
 *    *
dtype0*
_output_shapes
: 
¾
Dshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/stddevConst*
_output_shapes
: *3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
valueB
 *
×£<*
dtype0
ª
Mshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/TruncatedNormalTruncatedNormalCshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/shape*
seed2 *
dtype0*
_output_shapes
:	%*

seed *
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w
¼
Ashadow_net/sequence_rnn_module/w/Initializer/truncated_normal/mulMulMshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/TruncatedNormalDshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/stddev*
_output_shapes
:	%*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w
ª
=shadow_net/sequence_rnn_module/w/Initializer/truncated_normalAddAshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/mulBshadow_net/sequence_rnn_module/w/Initializer/truncated_normal/mean*
_output_shapes
:	%*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w
Ë
 shadow_net/sequence_rnn_module/w
VariableV2*
shared_name *3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
	container *
shape:	%*
dtype0*
_output_shapes
:	%

'shadow_net/sequence_rnn_module/w/AssignAssign shadow_net/sequence_rnn_module/w=shadow_net/sequence_rnn_module/w/Initializer/truncated_normal*
use_locking(*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
validate_shape(*
_output_shapes
:	%
²
%shadow_net/sequence_rnn_module/w/readIdentity shadow_net/sequence_rnn_module/w*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
_output_shapes
:	%
Í
%shadow_net/sequence_rnn_module/logitsMatMul&shadow_net/sequence_rnn_module/Reshape%shadow_net/sequence_rnn_module/w/read*
transpose_b( *
T0*
_output_shapes

:%*
transpose_a( 
~
4shadow_net/sequence_rnn_module/strided_slice_3/stackConst*
valueB: *
dtype0*
_output_shapes
:

6shadow_net/sequence_rnn_module/strided_slice_3/stack_1Const*
dtype0*
_output_shapes
:*
valueB:

6shadow_net/sequence_rnn_module/strided_slice_3/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

.shadow_net/sequence_rnn_module/strided_slice_3StridedSlice$shadow_net/sequence_rnn_module/Shape4shadow_net/sequence_rnn_module/strided_slice_3/stack6shadow_net/sequence_rnn_module/strided_slice_3/stack_16shadow_net/sequence_rnn_module/strided_slice_3/stack_2*
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask 
~
4shadow_net/sequence_rnn_module/strided_slice_4/stackConst*
valueB:*
dtype0*
_output_shapes
:

6shadow_net/sequence_rnn_module/strided_slice_4/stack_1Const*
_output_shapes
:*
valueB:*
dtype0

6shadow_net/sequence_rnn_module/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:

.shadow_net/sequence_rnn_module/strided_slice_4StridedSlice$shadow_net/sequence_rnn_module/Shape4shadow_net/sequence_rnn_module/strided_slice_4/stack6shadow_net/sequence_rnn_module/strided_slice_4/stack_16shadow_net/sequence_rnn_module/strided_slice_4/stack_2*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
Index0*
T0
w
5shadow_net/sequence_rnn_module/logits_reshape/shape/2Const*
_output_shapes
: *
value	B :%*
dtype0

3shadow_net/sequence_rnn_module/logits_reshape/shapePack.shadow_net/sequence_rnn_module/strided_slice_3.shadow_net/sequence_rnn_module/strided_slice_45shadow_net/sequence_rnn_module/logits_reshape/shape/2*
T0*

axis *
N*
_output_shapes
:
Ï
-shadow_net/sequence_rnn_module/logits_reshapeReshape%shadow_net/sequence_rnn_module/logits3shadow_net/sequence_rnn_module/logits_reshape/shape*
T0*
Tshape0*"
_output_shapes
:%

&shadow_net/sequence_rnn_module/SoftmaxSoftmax-shadow_net/sequence_rnn_module/logits_reshape*
T0*"
_output_shapes
:%
y
7shadow_net/sequence_rnn_module/raw_prediction/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
à
-shadow_net/sequence_rnn_module/raw_predictionArgMax&shadow_net/sequence_rnn_module/Softmax7shadow_net/sequence_rnn_module/raw_prediction/dimension*

Tidx0*
T0*
output_type0	*
_output_shapes

:

8shadow_net/sequence_rnn_module/transpose_time_major/permConst*!
valueB"          *
dtype0*
_output_shapes
:
ã
3shadow_net/sequence_rnn_module/transpose_time_major	Transpose-shadow_net/sequence_rnn_module/logits_reshape8shadow_net/sequence_rnn_module/transpose_time_major/perm*"
_output_shapes
:%*
Tperm0*
T0
n
$CTCBeamSearchDecoder/sequence_lengthConst*
valueB:*
dtype0*
_output_shapes
:

CTCBeamSearchDecoderCTCBeamSearchDecoder3shadow_net/sequence_rnn_module/transpose_time_major$CTCBeamSearchDecoder/sequence_length*
	top_paths*F
_output_shapes4
2:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ::*

beam_widthd*
merge_repeated( 
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
§
save/SaveV2/tensor_namesConst*Ú
valueÐBÍ.B-shadow_net/feature_extraction_module/bn3/betaB.shadow_net/feature_extraction_module/bn3/gammaB4shadow_net/feature_extraction_module/bn3/moving_meanB8shadow_net/feature_extraction_module/bn3/moving_varianceB-shadow_net/feature_extraction_module/bn4/betaB.shadow_net/feature_extraction_module/bn4/gammaB4shadow_net/feature_extraction_module/bn4/moving_meanB8shadow_net/feature_extraction_module/bn4/moving_varianceB-shadow_net/feature_extraction_module/bn5/betaB.shadow_net/feature_extraction_module/bn5/gammaB4shadow_net/feature_extraction_module/bn5/moving_meanB8shadow_net/feature_extraction_module/bn5/moving_varianceB-shadow_net/feature_extraction_module/bn6/betaB.shadow_net/feature_extraction_module/bn6/gammaB4shadow_net/feature_extraction_module/bn6/moving_meanB8shadow_net/feature_extraction_module/bn6/moving_varianceB-shadow_net/feature_extraction_module/bn7/betaB.shadow_net/feature_extraction_module/bn7/gammaB4shadow_net/feature_extraction_module/bn7/moving_meanB8shadow_net/feature_extraction_module/bn7/moving_varianceB2shadow_net/feature_extraction_module/conv1/bn/betaB3shadow_net/feature_extraction_module/conv1/bn/gammaB9shadow_net/feature_extraction_module/conv1/bn/moving_meanB=shadow_net/feature_extraction_module/conv1/bn/moving_varianceB1shadow_net/feature_extraction_module/conv1/conv/WB1shadow_net/feature_extraction_module/conv1/conv/bB2shadow_net/feature_extraction_module/conv2/bn/betaB3shadow_net/feature_extraction_module/conv2/bn/gammaB9shadow_net/feature_extraction_module/conv2/bn/moving_meanB=shadow_net/feature_extraction_module/conv2/bn/moving_varianceB1shadow_net/feature_extraction_module/conv2/conv/WB1shadow_net/feature_extraction_module/conv2/conv/bB,shadow_net/feature_extraction_module/conv3/WB,shadow_net/feature_extraction_module/conv4/WB,shadow_net/feature_extraction_module/conv5/WB,shadow_net/feature_extraction_module/conv6/WB,shadow_net/feature_extraction_module/conv7/WBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelB shadow_net/sequence_rnn_module/w*
dtype0*
_output_shapes
:.
¿
save/SaveV2/shape_and_slicesConst*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:.
Ü
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slices-shadow_net/feature_extraction_module/bn3/beta.shadow_net/feature_extraction_module/bn3/gamma4shadow_net/feature_extraction_module/bn3/moving_mean8shadow_net/feature_extraction_module/bn3/moving_variance-shadow_net/feature_extraction_module/bn4/beta.shadow_net/feature_extraction_module/bn4/gamma4shadow_net/feature_extraction_module/bn4/moving_mean8shadow_net/feature_extraction_module/bn4/moving_variance-shadow_net/feature_extraction_module/bn5/beta.shadow_net/feature_extraction_module/bn5/gamma4shadow_net/feature_extraction_module/bn5/moving_mean8shadow_net/feature_extraction_module/bn5/moving_variance-shadow_net/feature_extraction_module/bn6/beta.shadow_net/feature_extraction_module/bn6/gamma4shadow_net/feature_extraction_module/bn6/moving_mean8shadow_net/feature_extraction_module/bn6/moving_variance-shadow_net/feature_extraction_module/bn7/beta.shadow_net/feature_extraction_module/bn7/gamma4shadow_net/feature_extraction_module/bn7/moving_mean8shadow_net/feature_extraction_module/bn7/moving_variance2shadow_net/feature_extraction_module/conv1/bn/beta3shadow_net/feature_extraction_module/conv1/bn/gamma9shadow_net/feature_extraction_module/conv1/bn/moving_mean=shadow_net/feature_extraction_module/conv1/bn/moving_variance1shadow_net/feature_extraction_module/conv1/conv/W1shadow_net/feature_extraction_module/conv1/conv/b2shadow_net/feature_extraction_module/conv2/bn/beta3shadow_net/feature_extraction_module/conv2/bn/gamma9shadow_net/feature_extraction_module/conv2/bn/moving_mean=shadow_net/feature_extraction_module/conv2/bn/moving_variance1shadow_net/feature_extraction_module/conv2/conv/W1shadow_net/feature_extraction_module/conv2/conv/b,shadow_net/feature_extraction_module/conv3/W,shadow_net/feature_extraction_module/conv4/W,shadow_net/feature_extraction_module/conv5/W,shadow_net/feature_extraction_module/conv6/W,shadow_net/feature_extraction_module/conv7/Washadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel shadow_net/sequence_rnn_module/w*<
dtypes2
02.
}
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const*
_output_shapes
: 
¹
save/RestoreV2/tensor_namesConst"/device:CPU:0*Ú
valueÐBÍ.B-shadow_net/feature_extraction_module/bn3/betaB.shadow_net/feature_extraction_module/bn3/gammaB4shadow_net/feature_extraction_module/bn3/moving_meanB8shadow_net/feature_extraction_module/bn3/moving_varianceB-shadow_net/feature_extraction_module/bn4/betaB.shadow_net/feature_extraction_module/bn4/gammaB4shadow_net/feature_extraction_module/bn4/moving_meanB8shadow_net/feature_extraction_module/bn4/moving_varianceB-shadow_net/feature_extraction_module/bn5/betaB.shadow_net/feature_extraction_module/bn5/gammaB4shadow_net/feature_extraction_module/bn5/moving_meanB8shadow_net/feature_extraction_module/bn5/moving_varianceB-shadow_net/feature_extraction_module/bn6/betaB.shadow_net/feature_extraction_module/bn6/gammaB4shadow_net/feature_extraction_module/bn6/moving_meanB8shadow_net/feature_extraction_module/bn6/moving_varianceB-shadow_net/feature_extraction_module/bn7/betaB.shadow_net/feature_extraction_module/bn7/gammaB4shadow_net/feature_extraction_module/bn7/moving_meanB8shadow_net/feature_extraction_module/bn7/moving_varianceB2shadow_net/feature_extraction_module/conv1/bn/betaB3shadow_net/feature_extraction_module/conv1/bn/gammaB9shadow_net/feature_extraction_module/conv1/bn/moving_meanB=shadow_net/feature_extraction_module/conv1/bn/moving_varianceB1shadow_net/feature_extraction_module/conv1/conv/WB1shadow_net/feature_extraction_module/conv1/conv/bB2shadow_net/feature_extraction_module/conv2/bn/betaB3shadow_net/feature_extraction_module/conv2/bn/gammaB9shadow_net/feature_extraction_module/conv2/bn/moving_meanB=shadow_net/feature_extraction_module/conv2/bn/moving_varianceB1shadow_net/feature_extraction_module/conv2/conv/WB1shadow_net/feature_extraction_module/conv2/conv/bB,shadow_net/feature_extraction_module/conv3/WB,shadow_net/feature_extraction_module/conv4/WB,shadow_net/feature_extraction_module/conv5/WB,shadow_net/feature_extraction_module/conv6/WB,shadow_net/feature_extraction_module/conv7/WBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelB shadow_net/sequence_rnn_module/w*
dtype0*
_output_shapes
:.
Ñ
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:.*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*Î
_output_shapes»
¸::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.
å
save/AssignAssign-shadow_net/feature_extraction_module/bn3/betasave/RestoreV2*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta
ë
save/Assign_1Assign.shadow_net/feature_extraction_module/bn3/gammasave/RestoreV2:1*A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
÷
save/Assign_2Assign4shadow_net/feature_extraction_module/bn3/moving_meansave/RestoreV2:2*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
validate_shape(*
_output_shapes	
:
ÿ
save/Assign_3Assign8shadow_net/feature_extraction_module/bn3/moving_variancesave/RestoreV2:3*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
é
save/Assign_4Assign-shadow_net/feature_extraction_module/bn4/betasave/RestoreV2:4*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta
ë
save/Assign_5Assign.shadow_net/feature_extraction_module/bn4/gammasave/RestoreV2:5*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
validate_shape(*
_output_shapes	
:*
use_locking(
÷
save/Assign_6Assign4shadow_net/feature_extraction_module/bn4/moving_meansave/RestoreV2:6*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
validate_shape(*
_output_shapes	
:
ÿ
save/Assign_7Assign8shadow_net/feature_extraction_module/bn4/moving_variancesave/RestoreV2:7*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
validate_shape(*
_output_shapes	
:
é
save/Assign_8Assign-shadow_net/feature_extraction_module/bn5/betasave/RestoreV2:8*
_output_shapes	
:*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
validate_shape(
ë
save/Assign_9Assign.shadow_net/feature_extraction_module/bn5/gammasave/RestoreV2:9*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
validate_shape(*
_output_shapes	
:
ù
save/Assign_10Assign4shadow_net/feature_extraction_module/bn5/moving_meansave/RestoreV2:10*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(

save/Assign_11Assign8shadow_net/feature_extraction_module/bn5/moving_variancesave/RestoreV2:11*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance*
validate_shape(*
_output_shapes	
:
ë
save/Assign_12Assign-shadow_net/feature_extraction_module/bn6/betasave/RestoreV2:12*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
í
save/Assign_13Assign.shadow_net/feature_extraction_module/bn6/gammasave/RestoreV2:13*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma*
validate_shape(*
_output_shapes	
:
ù
save/Assign_14Assign4shadow_net/feature_extraction_module/bn6/moving_meansave/RestoreV2:14*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(

save/Assign_15Assign8shadow_net/feature_extraction_module/bn6/moving_variancesave/RestoreV2:15*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
validate_shape(*
_output_shapes	
:
ë
save/Assign_16Assign-shadow_net/feature_extraction_module/bn7/betasave/RestoreV2:16*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
í
save/Assign_17Assign.shadow_net/feature_extraction_module/bn7/gammasave/RestoreV2:17*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma
ù
save/Assign_18Assign4shadow_net/feature_extraction_module/bn7/moving_meansave/RestoreV2:18*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean*
validate_shape(*
_output_shapes	
:

save/Assign_19Assign8shadow_net/feature_extraction_module/bn7/moving_variancesave/RestoreV2:19*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
validate_shape(*
_output_shapes	
:
ô
save/Assign_20Assign2shadow_net/feature_extraction_module/conv1/bn/betasave/RestoreV2:20*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
validate_shape(*
_output_shapes
:@
ö
save/Assign_21Assign3shadow_net/feature_extraction_module/conv1/bn/gammasave/RestoreV2:21*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma

save/Assign_22Assign9shadow_net/feature_extraction_module/conv1/bn/moving_meansave/RestoreV2:22*
use_locking(*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean*
validate_shape(*
_output_shapes
:@

save/Assign_23Assign=shadow_net/feature_extraction_module/conv1/bn/moving_variancesave/RestoreV2:23*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance*
validate_shape(*
_output_shapes
:@*
use_locking(
þ
save/Assign_24Assign1shadow_net/feature_extraction_module/conv1/conv/Wsave/RestoreV2:24*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
validate_shape(*&
_output_shapes
:@
ò
save/Assign_25Assign1shadow_net/feature_extraction_module/conv1/conv/bsave/RestoreV2:25*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b*
validate_shape(*
_output_shapes
:@
õ
save/Assign_26Assign2shadow_net/feature_extraction_module/conv2/bn/betasave/RestoreV2:26*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
validate_shape(*
_output_shapes	
:
÷
save/Assign_27Assign3shadow_net/feature_extraction_module/conv2/bn/gammasave/RestoreV2:27*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0

save/Assign_28Assign9shadow_net/feature_extraction_module/conv2/bn/moving_meansave/RestoreV2:28*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0

save/Assign_29Assign=shadow_net/feature_extraction_module/conv2/bn/moving_variancesave/RestoreV2:29*
use_locking(*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
validate_shape(*
_output_shapes	
:
ÿ
save/Assign_30Assign1shadow_net/feature_extraction_module/conv2/conv/Wsave/RestoreV2:30*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
validate_shape(*'
_output_shapes
:@*
use_locking(*
T0
ó
save/Assign_31Assign1shadow_net/feature_extraction_module/conv2/conv/bsave/RestoreV2:31*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
validate_shape(*
_output_shapes	
:
ö
save/Assign_32Assign,shadow_net/feature_extraction_module/conv3/Wsave/RestoreV2:32*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
validate_shape(*(
_output_shapes
:*
use_locking(*
T0
ö
save/Assign_33Assign,shadow_net/feature_extraction_module/conv4/Wsave/RestoreV2:33*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W*
validate_shape(*(
_output_shapes
:*
use_locking(*
T0
ö
save/Assign_34Assign,shadow_net/feature_extraction_module/conv5/Wsave/RestoreV2:34*(
_output_shapes
:*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
validate_shape(
ö
save/Assign_35Assign,shadow_net/feature_extraction_module/conv6/Wsave/RestoreV2:35*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
validate_shape(*(
_output_shapes
:*
use_locking(
ö
save/Assign_36Assign,shadow_net/feature_extraction_module/conv7/Wsave/RestoreV2:36*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
validate_shape(*(
_output_shapes
:
Ó
save/Assign_37Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biassave/RestoreV2:37*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias
Ü
save/Assign_38Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelsave/RestoreV2:38*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:

Ó
save/Assign_39Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biassave/RestoreV2:39*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
Ü
save/Assign_40Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelsave/RestoreV2:40*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(
Ó
save/Assign_41Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biassave/RestoreV2:41*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
Ü
save/Assign_42Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelsave/RestoreV2:42*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel
Ó
save/Assign_43Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biassave/RestoreV2:43*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:
Ü
save/Assign_44Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelsave/RestoreV2:44*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel
Õ
save/Assign_45Assign shadow_net/sequence_rnn_module/wsave/RestoreV2:45*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
validate_shape(*
_output_shapes
:	%*
use_locking(

save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_3^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36^save/Assign_37^save/Assign_38^save/Assign_39^save/Assign_4^save/Assign_40^save/Assign_41^save/Assign_42^save/Assign_43^save/Assign_44^save/Assign_45^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 

save_1/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_6282abea12054003bfe30f8e3ac40230/part
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
_output_shapes
: *
	separator *
N
S
save_1/num_shardsConst*
_output_shapes
: *
value	B :*
dtype0
m
save_1/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
value	B : *
dtype0

save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards"/device:CPU:0*
_output_shapes
: 
¸
save_1/SaveV2/tensor_namesConst"/device:CPU:0*Ú
valueÐBÍ.B-shadow_net/feature_extraction_module/bn3/betaB.shadow_net/feature_extraction_module/bn3/gammaB4shadow_net/feature_extraction_module/bn3/moving_meanB8shadow_net/feature_extraction_module/bn3/moving_varianceB-shadow_net/feature_extraction_module/bn4/betaB.shadow_net/feature_extraction_module/bn4/gammaB4shadow_net/feature_extraction_module/bn4/moving_meanB8shadow_net/feature_extraction_module/bn4/moving_varianceB-shadow_net/feature_extraction_module/bn5/betaB.shadow_net/feature_extraction_module/bn5/gammaB4shadow_net/feature_extraction_module/bn5/moving_meanB8shadow_net/feature_extraction_module/bn5/moving_varianceB-shadow_net/feature_extraction_module/bn6/betaB.shadow_net/feature_extraction_module/bn6/gammaB4shadow_net/feature_extraction_module/bn6/moving_meanB8shadow_net/feature_extraction_module/bn6/moving_varianceB-shadow_net/feature_extraction_module/bn7/betaB.shadow_net/feature_extraction_module/bn7/gammaB4shadow_net/feature_extraction_module/bn7/moving_meanB8shadow_net/feature_extraction_module/bn7/moving_varianceB2shadow_net/feature_extraction_module/conv1/bn/betaB3shadow_net/feature_extraction_module/conv1/bn/gammaB9shadow_net/feature_extraction_module/conv1/bn/moving_meanB=shadow_net/feature_extraction_module/conv1/bn/moving_varianceB1shadow_net/feature_extraction_module/conv1/conv/WB1shadow_net/feature_extraction_module/conv1/conv/bB2shadow_net/feature_extraction_module/conv2/bn/betaB3shadow_net/feature_extraction_module/conv2/bn/gammaB9shadow_net/feature_extraction_module/conv2/bn/moving_meanB=shadow_net/feature_extraction_module/conv2/bn/moving_varianceB1shadow_net/feature_extraction_module/conv2/conv/WB1shadow_net/feature_extraction_module/conv2/conv/bB,shadow_net/feature_extraction_module/conv3/WB,shadow_net/feature_extraction_module/conv4/WB,shadow_net/feature_extraction_module/conv5/WB,shadow_net/feature_extraction_module/conv6/WB,shadow_net/feature_extraction_module/conv7/WBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelB shadow_net/sequence_rnn_module/w*
dtype0*
_output_shapes
:.
Ð
save_1/SaveV2/shape_and_slicesConst"/device:CPU:0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:.
ý
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slices-shadow_net/feature_extraction_module/bn3/beta.shadow_net/feature_extraction_module/bn3/gamma4shadow_net/feature_extraction_module/bn3/moving_mean8shadow_net/feature_extraction_module/bn3/moving_variance-shadow_net/feature_extraction_module/bn4/beta.shadow_net/feature_extraction_module/bn4/gamma4shadow_net/feature_extraction_module/bn4/moving_mean8shadow_net/feature_extraction_module/bn4/moving_variance-shadow_net/feature_extraction_module/bn5/beta.shadow_net/feature_extraction_module/bn5/gamma4shadow_net/feature_extraction_module/bn5/moving_mean8shadow_net/feature_extraction_module/bn5/moving_variance-shadow_net/feature_extraction_module/bn6/beta.shadow_net/feature_extraction_module/bn6/gamma4shadow_net/feature_extraction_module/bn6/moving_mean8shadow_net/feature_extraction_module/bn6/moving_variance-shadow_net/feature_extraction_module/bn7/beta.shadow_net/feature_extraction_module/bn7/gamma4shadow_net/feature_extraction_module/bn7/moving_mean8shadow_net/feature_extraction_module/bn7/moving_variance2shadow_net/feature_extraction_module/conv1/bn/beta3shadow_net/feature_extraction_module/conv1/bn/gamma9shadow_net/feature_extraction_module/conv1/bn/moving_mean=shadow_net/feature_extraction_module/conv1/bn/moving_variance1shadow_net/feature_extraction_module/conv1/conv/W1shadow_net/feature_extraction_module/conv1/conv/b2shadow_net/feature_extraction_module/conv2/bn/beta3shadow_net/feature_extraction_module/conv2/bn/gamma9shadow_net/feature_extraction_module/conv2/bn/moving_mean=shadow_net/feature_extraction_module/conv2/bn/moving_variance1shadow_net/feature_extraction_module/conv2/conv/W1shadow_net/feature_extraction_module/conv2/conv/b,shadow_net/feature_extraction_module/conv3/W,shadow_net/feature_extraction_module/conv4/W,shadow_net/feature_extraction_module/conv5/W,shadow_net/feature_extraction_module/conv6/W,shadow_net/feature_extraction_module/conv7/Washadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biascshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel shadow_net/sequence_rnn_module/w"/device:CPU:0*<
dtypes2
02.
¨
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2"/device:CPU:0*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
²
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency"/device:CPU:0*
_output_shapes
:*
T0*

axis *
N

save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const"/device:CPU:0*
delete_old_dirs(

save_1/IdentityIdentitysave_1/Const^save_1/MergeV2Checkpoints^save_1/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
»
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*Ú
valueÐBÍ.B-shadow_net/feature_extraction_module/bn3/betaB.shadow_net/feature_extraction_module/bn3/gammaB4shadow_net/feature_extraction_module/bn3/moving_meanB8shadow_net/feature_extraction_module/bn3/moving_varianceB-shadow_net/feature_extraction_module/bn4/betaB.shadow_net/feature_extraction_module/bn4/gammaB4shadow_net/feature_extraction_module/bn4/moving_meanB8shadow_net/feature_extraction_module/bn4/moving_varianceB-shadow_net/feature_extraction_module/bn5/betaB.shadow_net/feature_extraction_module/bn5/gammaB4shadow_net/feature_extraction_module/bn5/moving_meanB8shadow_net/feature_extraction_module/bn5/moving_varianceB-shadow_net/feature_extraction_module/bn6/betaB.shadow_net/feature_extraction_module/bn6/gammaB4shadow_net/feature_extraction_module/bn6/moving_meanB8shadow_net/feature_extraction_module/bn6/moving_varianceB-shadow_net/feature_extraction_module/bn7/betaB.shadow_net/feature_extraction_module/bn7/gammaB4shadow_net/feature_extraction_module/bn7/moving_meanB8shadow_net/feature_extraction_module/bn7/moving_varianceB2shadow_net/feature_extraction_module/conv1/bn/betaB3shadow_net/feature_extraction_module/conv1/bn/gammaB9shadow_net/feature_extraction_module/conv1/bn/moving_meanB=shadow_net/feature_extraction_module/conv1/bn/moving_varianceB1shadow_net/feature_extraction_module/conv1/conv/WB1shadow_net/feature_extraction_module/conv1/conv/bB2shadow_net/feature_extraction_module/conv2/bn/betaB3shadow_net/feature_extraction_module/conv2/bn/gammaB9shadow_net/feature_extraction_module/conv2/bn/moving_meanB=shadow_net/feature_extraction_module/conv2/bn/moving_varianceB1shadow_net/feature_extraction_module/conv2/conv/WB1shadow_net/feature_extraction_module/conv2/conv/bB,shadow_net/feature_extraction_module/conv3/WB,shadow_net/feature_extraction_module/conv4/WB,shadow_net/feature_extraction_module/conv5/WB,shadow_net/feature_extraction_module/conv6/WB,shadow_net/feature_extraction_module/conv7/WBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelBashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biasBcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelB shadow_net/sequence_rnn_module/w*
dtype0*
_output_shapes
:.
Ó
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:.

save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*Î
_output_shapes»
¸::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.
é
save_1/AssignAssign-shadow_net/feature_extraction_module/bn3/betasave_1/RestoreV2*
_output_shapes	
:*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn3/beta*
validate_shape(
ï
save_1/Assign_1Assign.shadow_net/feature_extraction_module/bn3/gammasave_1/RestoreV2:1*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn3/gamma*
validate_shape(*
_output_shapes	
:
û
save_1/Assign_2Assign4shadow_net/feature_extraction_module/bn3/moving_meansave_1/RestoreV2:2*
_output_shapes	
:*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn3/moving_mean*
validate_shape(

save_1/Assign_3Assign8shadow_net/feature_extraction_module/bn3/moving_variancesave_1/RestoreV2:3*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn3/moving_variance*
validate_shape(*
_output_shapes	
:
í
save_1/Assign_4Assign-shadow_net/feature_extraction_module/bn4/betasave_1/RestoreV2:4*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn4/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
ï
save_1/Assign_5Assign.shadow_net/feature_extraction_module/bn4/gammasave_1/RestoreV2:5*
_output_shapes	
:*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn4/gamma*
validate_shape(
û
save_1/Assign_6Assign4shadow_net/feature_extraction_module/bn4/moving_meansave_1/RestoreV2:6*
_output_shapes	
:*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn4/moving_mean*
validate_shape(

save_1/Assign_7Assign8shadow_net/feature_extraction_module/bn4/moving_variancesave_1/RestoreV2:7*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn4/moving_variance*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
í
save_1/Assign_8Assign-shadow_net/feature_extraction_module/bn5/betasave_1/RestoreV2:8*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn5/beta*
validate_shape(*
_output_shapes	
:
ï
save_1/Assign_9Assign.shadow_net/feature_extraction_module/bn5/gammasave_1/RestoreV2:9*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn5/gamma*
validate_shape(*
_output_shapes	
:
ý
save_1/Assign_10Assign4shadow_net/feature_extraction_module/bn5/moving_meansave_1/RestoreV2:10*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn5/moving_mean*
validate_shape(*
_output_shapes	
:

save_1/Assign_11Assign8shadow_net/feature_extraction_module/bn5/moving_variancesave_1/RestoreV2:11*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn5/moving_variance*
validate_shape(*
_output_shapes	
:
ï
save_1/Assign_12Assign-shadow_net/feature_extraction_module/bn6/betasave_1/RestoreV2:12*
_output_shapes	
:*
use_locking(*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn6/beta*
validate_shape(
ñ
save_1/Assign_13Assign.shadow_net/feature_extraction_module/bn6/gammasave_1/RestoreV2:13*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn6/gamma*
validate_shape(*
_output_shapes	
:
ý
save_1/Assign_14Assign4shadow_net/feature_extraction_module/bn6/moving_meansave_1/RestoreV2:14*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn6/moving_mean

save_1/Assign_15Assign8shadow_net/feature_extraction_module/bn6/moving_variancesave_1/RestoreV2:15*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn6/moving_variance*
validate_shape(*
_output_shapes	
:
ï
save_1/Assign_16Assign-shadow_net/feature_extraction_module/bn7/betasave_1/RestoreV2:16*
T0*@
_class6
42loc:@shadow_net/feature_extraction_module/bn7/beta*
validate_shape(*
_output_shapes	
:*
use_locking(
ñ
save_1/Assign_17Assign.shadow_net/feature_extraction_module/bn7/gammasave_1/RestoreV2:17*
use_locking(*
T0*A
_class7
53loc:@shadow_net/feature_extraction_module/bn7/gamma*
validate_shape(*
_output_shapes	
:
ý
save_1/Assign_18Assign4shadow_net/feature_extraction_module/bn7/moving_meansave_1/RestoreV2:18*
use_locking(*
T0*G
_class=
;9loc:@shadow_net/feature_extraction_module/bn7/moving_mean*
validate_shape(*
_output_shapes	
:

save_1/Assign_19Assign8shadow_net/feature_extraction_module/bn7/moving_variancesave_1/RestoreV2:19*
use_locking(*
T0*K
_classA
?=loc:@shadow_net/feature_extraction_module/bn7/moving_variance*
validate_shape(*
_output_shapes	
:
ø
save_1/Assign_20Assign2shadow_net/feature_extraction_module/conv1/bn/betasave_1/RestoreV2:20*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv1/bn/beta*
validate_shape(*
_output_shapes
:@
ú
save_1/Assign_21Assign3shadow_net/feature_extraction_module/conv1/bn/gammasave_1/RestoreV2:21*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv1/bn/gamma*
validate_shape(*
_output_shapes
:@*
use_locking(*
T0

save_1/Assign_22Assign9shadow_net/feature_extraction_module/conv1/bn/moving_meansave_1/RestoreV2:22*
use_locking(*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv1/bn/moving_mean*
validate_shape(*
_output_shapes
:@

save_1/Assign_23Assign=shadow_net/feature_extraction_module/conv1/bn/moving_variancesave_1/RestoreV2:23*
use_locking(*
T0*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv1/bn/moving_variance*
validate_shape(*
_output_shapes
:@

save_1/Assign_24Assign1shadow_net/feature_extraction_module/conv1/conv/Wsave_1/RestoreV2:24*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/W*
validate_shape(*&
_output_shapes
:@*
use_locking(*
T0
ö
save_1/Assign_25Assign1shadow_net/feature_extraction_module/conv1/conv/bsave_1/RestoreV2:25*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv1/conv/b*
validate_shape(*
_output_shapes
:@
ù
save_1/Assign_26Assign2shadow_net/feature_extraction_module/conv2/bn/betasave_1/RestoreV2:26*
use_locking(*
T0*E
_class;
97loc:@shadow_net/feature_extraction_module/conv2/bn/beta*
validate_shape(*
_output_shapes	
:
û
save_1/Assign_27Assign3shadow_net/feature_extraction_module/conv2/bn/gammasave_1/RestoreV2:27*
use_locking(*
T0*F
_class<
:8loc:@shadow_net/feature_extraction_module/conv2/bn/gamma*
validate_shape(*
_output_shapes	
:

save_1/Assign_28Assign9shadow_net/feature_extraction_module/conv2/bn/moving_meansave_1/RestoreV2:28*
use_locking(*
T0*L
_classB
@>loc:@shadow_net/feature_extraction_module/conv2/bn/moving_mean*
validate_shape(*
_output_shapes	
:

save_1/Assign_29Assign=shadow_net/feature_extraction_module/conv2/bn/moving_variancesave_1/RestoreV2:29*P
_classF
DBloc:@shadow_net/feature_extraction_module/conv2/bn/moving_variance*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0

save_1/Assign_30Assign1shadow_net/feature_extraction_module/conv2/conv/Wsave_1/RestoreV2:30*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/W*
validate_shape(*'
_output_shapes
:@*
use_locking(
÷
save_1/Assign_31Assign1shadow_net/feature_extraction_module/conv2/conv/bsave_1/RestoreV2:31*
_output_shapes	
:*
use_locking(*
T0*D
_class:
86loc:@shadow_net/feature_extraction_module/conv2/conv/b*
validate_shape(
ú
save_1/Assign_32Assign,shadow_net/feature_extraction_module/conv3/Wsave_1/RestoreV2:32*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv3/W*
validate_shape(*(
_output_shapes
:
ú
save_1/Assign_33Assign,shadow_net/feature_extraction_module/conv4/Wsave_1/RestoreV2:33*
validate_shape(*(
_output_shapes
:*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv4/W
ú
save_1/Assign_34Assign,shadow_net/feature_extraction_module/conv5/Wsave_1/RestoreV2:34*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv5/W*
validate_shape(*(
_output_shapes
:
ú
save_1/Assign_35Assign,shadow_net/feature_extraction_module/conv6/Wsave_1/RestoreV2:35*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv6/W*
validate_shape(*(
_output_shapes
:
ú
save_1/Assign_36Assign,shadow_net/feature_extraction_module/conv7/Wsave_1/RestoreV2:36*
use_locking(*
T0*?
_class5
31loc:@shadow_net/feature_extraction_module/conv7/W*
validate_shape(*(
_output_shapes
:
×
save_1/Assign_37Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/biassave_1/RestoreV2:37*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(
à
save_1/Assign_38Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernelsave_1/RestoreV2:38*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:

×
save_1/Assign_39Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/biassave_1/RestoreV2:39*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:*
use_locking(*
T0
à
save_1/Assign_40Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernelsave_1/RestoreV2:40* 
_output_shapes
:
*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel*
validate_shape(
×
save_1/Assign_41Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/biassave_1/RestoreV2:41*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:
à
save_1/Assign_42Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernelsave_1/RestoreV2:42*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0
×
save_1/Assign_43Assignashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/biassave_1/RestoreV2:43*
use_locking(*
T0*t
_classj
hfloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias*
validate_shape(*
_output_shapes	
:
à
save_1/Assign_44Assigncshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernelsave_1/RestoreV2:44*
validate_shape(* 
_output_shapes
:
*
use_locking(*
T0*v
_classl
jhloc:@shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel
Ù
save_1/Assign_45Assign shadow_net/sequence_rnn_module/wsave_1/RestoreV2:45*
T0*3
_class)
'%loc:@shadow_net/sequence_rnn_module/w*
validate_shape(*
_output_shapes
:	%*
use_locking(
ú
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_11^save_1/Assign_12^save_1/Assign_13^save_1/Assign_14^save_1/Assign_15^save_1/Assign_16^save_1/Assign_17^save_1/Assign_18^save_1/Assign_19^save_1/Assign_2^save_1/Assign_20^save_1/Assign_21^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_4^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8^save_1/Assign_9
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"¸H
trainable_variables HH
ý
3shadow_net/feature_extraction_module/conv1/conv/W:08shadow_net/feature_extraction_module/conv1/conv/W/Assign8shadow_net/feature_extraction_module/conv1/conv/W/read:02Pshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal:08
ò
3shadow_net/feature_extraction_module/conv1/conv/b:08shadow_net/feature_extraction_module/conv1/conv/b/Assign8shadow_net/feature_extraction_module/conv1/conv/b/read:02Eshadow_net/feature_extraction_module/conv1/conv/b/Initializer/Const:08
ù
5shadow_net/feature_extraction_module/conv1/bn/gamma:0:shadow_net/feature_extraction_module/conv1/bn/gamma/Assign:shadow_net/feature_extraction_module/conv1/bn/gamma/read:02Fshadow_net/feature_extraction_module/conv1/bn/gamma/Initializer/ones:08
ö
4shadow_net/feature_extraction_module/conv1/bn/beta:09shadow_net/feature_extraction_module/conv1/bn/beta/Assign9shadow_net/feature_extraction_module/conv1/bn/beta/read:02Fshadow_net/feature_extraction_module/conv1/bn/beta/Initializer/zeros:08
ý
3shadow_net/feature_extraction_module/conv2/conv/W:08shadow_net/feature_extraction_module/conv2/conv/W/Assign8shadow_net/feature_extraction_module/conv2/conv/W/read:02Pshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal:08
ò
3shadow_net/feature_extraction_module/conv2/conv/b:08shadow_net/feature_extraction_module/conv2/conv/b/Assign8shadow_net/feature_extraction_module/conv2/conv/b/read:02Eshadow_net/feature_extraction_module/conv2/conv/b/Initializer/Const:08
ù
5shadow_net/feature_extraction_module/conv2/bn/gamma:0:shadow_net/feature_extraction_module/conv2/bn/gamma/Assign:shadow_net/feature_extraction_module/conv2/bn/gamma/read:02Fshadow_net/feature_extraction_module/conv2/bn/gamma/Initializer/ones:08
ö
4shadow_net/feature_extraction_module/conv2/bn/beta:09shadow_net/feature_extraction_module/conv2/bn/beta/Assign9shadow_net/feature_extraction_module/conv2/bn/beta/read:02Fshadow_net/feature_extraction_module/conv2/bn/beta/Initializer/zeros:08
é
.shadow_net/feature_extraction_module/conv3/W:03shadow_net/feature_extraction_module/conv3/W/Assign3shadow_net/feature_extraction_module/conv3/W/read:02Kshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn3/gamma:05shadow_net/feature_extraction_module/bn3/gamma/Assign5shadow_net/feature_extraction_module/bn3/gamma/read:02Ashadow_net/feature_extraction_module/bn3/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn3/beta:04shadow_net/feature_extraction_module/bn3/beta/Assign4shadow_net/feature_extraction_module/bn3/beta/read:02Ashadow_net/feature_extraction_module/bn3/beta/Initializer/zeros:08
é
.shadow_net/feature_extraction_module/conv4/W:03shadow_net/feature_extraction_module/conv4/W/Assign3shadow_net/feature_extraction_module/conv4/W/read:02Kshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn4/gamma:05shadow_net/feature_extraction_module/bn4/gamma/Assign5shadow_net/feature_extraction_module/bn4/gamma/read:02Ashadow_net/feature_extraction_module/bn4/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn4/beta:04shadow_net/feature_extraction_module/bn4/beta/Assign4shadow_net/feature_extraction_module/bn4/beta/read:02Ashadow_net/feature_extraction_module/bn4/beta/Initializer/zeros:08
é
.shadow_net/feature_extraction_module/conv5/W:03shadow_net/feature_extraction_module/conv5/W/Assign3shadow_net/feature_extraction_module/conv5/W/read:02Kshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn5/gamma:05shadow_net/feature_extraction_module/bn5/gamma/Assign5shadow_net/feature_extraction_module/bn5/gamma/read:02Ashadow_net/feature_extraction_module/bn5/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn5/beta:04shadow_net/feature_extraction_module/bn5/beta/Assign4shadow_net/feature_extraction_module/bn5/beta/read:02Ashadow_net/feature_extraction_module/bn5/beta/Initializer/zeros:08
é
.shadow_net/feature_extraction_module/conv6/W:03shadow_net/feature_extraction_module/conv6/W/Assign3shadow_net/feature_extraction_module/conv6/W/read:02Kshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn6/gamma:05shadow_net/feature_extraction_module/bn6/gamma/Assign5shadow_net/feature_extraction_module/bn6/gamma/read:02Ashadow_net/feature_extraction_module/bn6/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn6/beta:04shadow_net/feature_extraction_module/bn6/beta/Assign4shadow_net/feature_extraction_module/bn6/beta/read:02Ashadow_net/feature_extraction_module/bn6/beta/Initializer/zeros:08
é
.shadow_net/feature_extraction_module/conv7/W:03shadow_net/feature_extraction_module/conv7/W/Assign3shadow_net/feature_extraction_module/conv7/W/read:02Kshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn7/gamma:05shadow_net/feature_extraction_module/bn7/gamma/Assign5shadow_net/feature_extraction_module/bn7/gamma/read:02Ashadow_net/feature_extraction_module/bn7/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn7/beta:04shadow_net/feature_extraction_module/bn7/beta/Assign4shadow_net/feature_extraction_module/bn7/beta/read:02Ashadow_net/feature_extraction_module/bn7/beta/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros:08
¹
"shadow_net/sequence_rnn_module/w:0'shadow_net/sequence_rnn_module/w/Assign'shadow_net/sequence_rnn_module/w/read:02?shadow_net/sequence_rnn_module/w/Initializer/truncated_normal:08"É
cond_context¸µ
¸
:shadow_net/sequence_rnn_module/sequence_drop_out/cond_text:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0;shadow_net/sequence_rnn_module/sequence_drop_out/switch_t:0 *þ

@shadow_net/sequence_rnn_module/sequence_drop_out/dropout/Floor:0
@shadow_net/sequence_rnn_module/sequence_drop_out/dropout/Shape:0
>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/add:0
Eshadow_net/sequence_rnn_module/sequence_drop_out/dropout/div/Switch:1
>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/div:0
Dshadow_net/sequence_rnn_module/sequence_drop_out/dropout/keep_prob:0
>shadow_net/sequence_rnn_module/sequence_drop_out/dropout/mul:0
Wshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/RandomUniform:0
Mshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/max:0
Mshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/min:0
Mshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/mul:0
Mshadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform/sub:0
Ishadow_net/sequence_rnn_module/sequence_drop_out/dropout/random_uniform:0
:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0
;shadow_net/sequence_rnn_module/sequence_drop_out/switch_t:0
Fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat:0
Fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat:0Eshadow_net/sequence_rnn_module/sequence_drop_out/dropout/div/Switch:1x
:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0
÷
<shadow_net/sequence_rnn_module/sequence_drop_out/cond_text_1:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0;shadow_net/sequence_rnn_module/sequence_drop_out/switch_f:0*½
;shadow_net/sequence_rnn_module/sequence_drop_out/Switch_1:0
;shadow_net/sequence_rnn_module/sequence_drop_out/Switch_1:1
:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0
;shadow_net/sequence_rnn_module/sequence_drop_out/switch_f:0
Fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat:0x
:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0:shadow_net/sequence_rnn_module/sequence_drop_out/pred_id:0
Fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/concat:0;shadow_net/sequence_rnn_module/sequence_drop_out/Switch_1:0"û
while_contextèä
¶`
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/while_context *fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond:02cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge:0:fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity:0Bbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_1:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_2:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_3:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_4:0J«T
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Minimum:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_4:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_1:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_2:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_3:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Exit_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_2:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_3:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Identity_4:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less/Enter:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1/Enter:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LogicalAnd:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/LoopCond:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_1:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_2:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_3:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_4:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Merge_4:1
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_2:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_3:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/NextIteration_4:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_1:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_1:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_2:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_2:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_3:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_3:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Switch_4:1
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add/y:0
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1/y:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/add_1:0
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Const:0
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2:0
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add/y:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/add_1:0
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axis:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/concat:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dim:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:1
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:2
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/split:3
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/read:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/read:0á
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/read:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1:0Þ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray_1:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter:0Ñ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less/Enter:0ï
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/TensorArray:0shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0Í
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/Minimum:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Less_1/Enter:0â
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/read:0tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter:0Rcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_1:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_2:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_3:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/while/Enter_4:0Zeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/fw/strided_slice:0
¶`
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/while_context *fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond:02cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge:0:fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity:0Bbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_1:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_2:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_3:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_4:0J«T
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Minimum:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_4:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_1:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_2:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_3:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Exit_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_2:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_3:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Identity_4:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less/Enter:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1/Enter:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LogicalAnd:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/LoopCond:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_1:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_2:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_3:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_4:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Merge_4:1
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_2:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_3:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/NextIteration_4:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_1:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_1:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_2:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_2:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_3:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_3:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Switch_4:1
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add/y:0
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1/y:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/add_1:0
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Const:0
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2:0
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add/y:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/add_1:0
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axis:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/concat:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dim:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:1
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:2
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/split:3
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/read:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/read:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1:0â
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/read:0tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter:0á
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/read:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter:0Þ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray_1:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter:0Ñ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less/Enter:0ï
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/TensorArray:0shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0Í
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/Minimum:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Less_1/Enter:0Rcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_1:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_2:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_3:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/while/Enter_4:0Zeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/bw/strided_slice:0
¶`
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/while_context *fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond:02cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge:0:fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity:0Bbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_1:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_2:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_3:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_4:0J«T
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Minimum:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_4:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_1:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_2:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_3:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Exit_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_2:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_3:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Identity_4:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less/Enter:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1/Enter:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LogicalAnd:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/LoopCond:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_1:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_2:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_3:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_4:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Merge_4:1
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_2:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_3:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/NextIteration_4:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_1:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_1:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_2:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_2:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_3:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_3:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Switch_4:1
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add/y:0
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1/y:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/add_1:0
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Const:0
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_1:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Sigmoid_2:0
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/Tanh_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add/y:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/add_1:0
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concat/axis:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/concat:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/mul_2:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split/split_dim:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:1
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:2
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/split:3
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/read:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/read:0â
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/read:0tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/MatMul/Enter:0ï
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray:0shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0Í
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/Minimum:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less_1/Enter:0Þ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArray_1:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/TensorArrayReadV3/Enter_1:0Ñ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Less/Enter:0á
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/read:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/lstm_cell/BiasAdd/Enter:0Rcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_1:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_2:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_3:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/while/Enter_4:0Zeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/fw/strided_slice:0
¶`
ishadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/while_context *fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond:02cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge:0:fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity:0Bbshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_1:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_2:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_3:0Bdshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_4:0J«T
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Minimum:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_4:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_1:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_2:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_3:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Exit_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_2:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_3:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Identity_4:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less/Enter:0
bshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1/Enter:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1:0
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LogicalAnd:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/LoopCond:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_1:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_2:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_2:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_3:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_3:1
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_4:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Merge_4:1
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_2:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_3:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/NextIteration_4:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch:0
dshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_1:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_1:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_2:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_2:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_3:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_3:1
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_4:0
fshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Switch_4:1
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add/y:0
ashadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add:0
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1/y:0
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/add_1:0
ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Const:0
tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul:0
oshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_1:0
qshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Sigmoid_2:0
lshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/Tanh_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add/y:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/add_1:0
sshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concat/axis:0
nshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/concat:0
kshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_1:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/mul_2:0
wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split/split_dim:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:0
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:1
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:2
mshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/split:3
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/read:0
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/read:0á
hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/read:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/BiasAdd/Enter:0ï
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray:0shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayWrite/TensorArrayWriteV3/Enter:0Í
_shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/Minimum:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less_1/Enter:0â
jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/read:0tshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/lstm_cell/MatMul/Enter:0Þ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArray_1:0ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter:0
shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/TensorArrayUnstack/TensorArrayScatter/TensorArrayScatterV3:0wshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/TensorArrayReadV3/Enter_1:0Ñ
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Less/Enter:0Rcshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_1:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_2:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_3:0Reshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/while/Enter_4:0Zeshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/bw/strided_slice:0"Ùe
	variablesËeÈe
ý
3shadow_net/feature_extraction_module/conv1/conv/W:08shadow_net/feature_extraction_module/conv1/conv/W/Assign8shadow_net/feature_extraction_module/conv1/conv/W/read:02Pshadow_net/feature_extraction_module/conv1/conv/W/Initializer/truncated_normal:08
ò
3shadow_net/feature_extraction_module/conv1/conv/b:08shadow_net/feature_extraction_module/conv1/conv/b/Assign8shadow_net/feature_extraction_module/conv1/conv/b/read:02Eshadow_net/feature_extraction_module/conv1/conv/b/Initializer/Const:08
ù
5shadow_net/feature_extraction_module/conv1/bn/gamma:0:shadow_net/feature_extraction_module/conv1/bn/gamma/Assign:shadow_net/feature_extraction_module/conv1/bn/gamma/read:02Fshadow_net/feature_extraction_module/conv1/bn/gamma/Initializer/ones:08
ö
4shadow_net/feature_extraction_module/conv1/bn/beta:09shadow_net/feature_extraction_module/conv1/bn/beta/Assign9shadow_net/feature_extraction_module/conv1/bn/beta/read:02Fshadow_net/feature_extraction_module/conv1/bn/beta/Initializer/zeros:08

;shadow_net/feature_extraction_module/conv1/bn/moving_mean:0@shadow_net/feature_extraction_module/conv1/bn/moving_mean/Assign@shadow_net/feature_extraction_module/conv1/bn/moving_mean/read:02Mshadow_net/feature_extraction_module/conv1/bn/moving_mean/Initializer/zeros:0

?shadow_net/feature_extraction_module/conv1/bn/moving_variance:0Dshadow_net/feature_extraction_module/conv1/bn/moving_variance/AssignDshadow_net/feature_extraction_module/conv1/bn/moving_variance/read:02Pshadow_net/feature_extraction_module/conv1/bn/moving_variance/Initializer/ones:0
ý
3shadow_net/feature_extraction_module/conv2/conv/W:08shadow_net/feature_extraction_module/conv2/conv/W/Assign8shadow_net/feature_extraction_module/conv2/conv/W/read:02Pshadow_net/feature_extraction_module/conv2/conv/W/Initializer/truncated_normal:08
ò
3shadow_net/feature_extraction_module/conv2/conv/b:08shadow_net/feature_extraction_module/conv2/conv/b/Assign8shadow_net/feature_extraction_module/conv2/conv/b/read:02Eshadow_net/feature_extraction_module/conv2/conv/b/Initializer/Const:08
ù
5shadow_net/feature_extraction_module/conv2/bn/gamma:0:shadow_net/feature_extraction_module/conv2/bn/gamma/Assign:shadow_net/feature_extraction_module/conv2/bn/gamma/read:02Fshadow_net/feature_extraction_module/conv2/bn/gamma/Initializer/ones:08
ö
4shadow_net/feature_extraction_module/conv2/bn/beta:09shadow_net/feature_extraction_module/conv2/bn/beta/Assign9shadow_net/feature_extraction_module/conv2/bn/beta/read:02Fshadow_net/feature_extraction_module/conv2/bn/beta/Initializer/zeros:08

;shadow_net/feature_extraction_module/conv2/bn/moving_mean:0@shadow_net/feature_extraction_module/conv2/bn/moving_mean/Assign@shadow_net/feature_extraction_module/conv2/bn/moving_mean/read:02Mshadow_net/feature_extraction_module/conv2/bn/moving_mean/Initializer/zeros:0

?shadow_net/feature_extraction_module/conv2/bn/moving_variance:0Dshadow_net/feature_extraction_module/conv2/bn/moving_variance/AssignDshadow_net/feature_extraction_module/conv2/bn/moving_variance/read:02Pshadow_net/feature_extraction_module/conv2/bn/moving_variance/Initializer/ones:0
é
.shadow_net/feature_extraction_module/conv3/W:03shadow_net/feature_extraction_module/conv3/W/Assign3shadow_net/feature_extraction_module/conv3/W/read:02Kshadow_net/feature_extraction_module/conv3/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn3/gamma:05shadow_net/feature_extraction_module/bn3/gamma/Assign5shadow_net/feature_extraction_module/bn3/gamma/read:02Ashadow_net/feature_extraction_module/bn3/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn3/beta:04shadow_net/feature_extraction_module/bn3/beta/Assign4shadow_net/feature_extraction_module/bn3/beta/read:02Ashadow_net/feature_extraction_module/bn3/beta/Initializer/zeros:08
ü
6shadow_net/feature_extraction_module/bn3/moving_mean:0;shadow_net/feature_extraction_module/bn3/moving_mean/Assign;shadow_net/feature_extraction_module/bn3/moving_mean/read:02Hshadow_net/feature_extraction_module/bn3/moving_mean/Initializer/zeros:0

:shadow_net/feature_extraction_module/bn3/moving_variance:0?shadow_net/feature_extraction_module/bn3/moving_variance/Assign?shadow_net/feature_extraction_module/bn3/moving_variance/read:02Kshadow_net/feature_extraction_module/bn3/moving_variance/Initializer/ones:0
é
.shadow_net/feature_extraction_module/conv4/W:03shadow_net/feature_extraction_module/conv4/W/Assign3shadow_net/feature_extraction_module/conv4/W/read:02Kshadow_net/feature_extraction_module/conv4/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn4/gamma:05shadow_net/feature_extraction_module/bn4/gamma/Assign5shadow_net/feature_extraction_module/bn4/gamma/read:02Ashadow_net/feature_extraction_module/bn4/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn4/beta:04shadow_net/feature_extraction_module/bn4/beta/Assign4shadow_net/feature_extraction_module/bn4/beta/read:02Ashadow_net/feature_extraction_module/bn4/beta/Initializer/zeros:08
ü
6shadow_net/feature_extraction_module/bn4/moving_mean:0;shadow_net/feature_extraction_module/bn4/moving_mean/Assign;shadow_net/feature_extraction_module/bn4/moving_mean/read:02Hshadow_net/feature_extraction_module/bn4/moving_mean/Initializer/zeros:0

:shadow_net/feature_extraction_module/bn4/moving_variance:0?shadow_net/feature_extraction_module/bn4/moving_variance/Assign?shadow_net/feature_extraction_module/bn4/moving_variance/read:02Kshadow_net/feature_extraction_module/bn4/moving_variance/Initializer/ones:0
é
.shadow_net/feature_extraction_module/conv5/W:03shadow_net/feature_extraction_module/conv5/W/Assign3shadow_net/feature_extraction_module/conv5/W/read:02Kshadow_net/feature_extraction_module/conv5/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn5/gamma:05shadow_net/feature_extraction_module/bn5/gamma/Assign5shadow_net/feature_extraction_module/bn5/gamma/read:02Ashadow_net/feature_extraction_module/bn5/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn5/beta:04shadow_net/feature_extraction_module/bn5/beta/Assign4shadow_net/feature_extraction_module/bn5/beta/read:02Ashadow_net/feature_extraction_module/bn5/beta/Initializer/zeros:08
ü
6shadow_net/feature_extraction_module/bn5/moving_mean:0;shadow_net/feature_extraction_module/bn5/moving_mean/Assign;shadow_net/feature_extraction_module/bn5/moving_mean/read:02Hshadow_net/feature_extraction_module/bn5/moving_mean/Initializer/zeros:0

:shadow_net/feature_extraction_module/bn5/moving_variance:0?shadow_net/feature_extraction_module/bn5/moving_variance/Assign?shadow_net/feature_extraction_module/bn5/moving_variance/read:02Kshadow_net/feature_extraction_module/bn5/moving_variance/Initializer/ones:0
é
.shadow_net/feature_extraction_module/conv6/W:03shadow_net/feature_extraction_module/conv6/W/Assign3shadow_net/feature_extraction_module/conv6/W/read:02Kshadow_net/feature_extraction_module/conv6/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn6/gamma:05shadow_net/feature_extraction_module/bn6/gamma/Assign5shadow_net/feature_extraction_module/bn6/gamma/read:02Ashadow_net/feature_extraction_module/bn6/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn6/beta:04shadow_net/feature_extraction_module/bn6/beta/Assign4shadow_net/feature_extraction_module/bn6/beta/read:02Ashadow_net/feature_extraction_module/bn6/beta/Initializer/zeros:08
ü
6shadow_net/feature_extraction_module/bn6/moving_mean:0;shadow_net/feature_extraction_module/bn6/moving_mean/Assign;shadow_net/feature_extraction_module/bn6/moving_mean/read:02Hshadow_net/feature_extraction_module/bn6/moving_mean/Initializer/zeros:0

:shadow_net/feature_extraction_module/bn6/moving_variance:0?shadow_net/feature_extraction_module/bn6/moving_variance/Assign?shadow_net/feature_extraction_module/bn6/moving_variance/read:02Kshadow_net/feature_extraction_module/bn6/moving_variance/Initializer/ones:0
é
.shadow_net/feature_extraction_module/conv7/W:03shadow_net/feature_extraction_module/conv7/W/Assign3shadow_net/feature_extraction_module/conv7/W/read:02Kshadow_net/feature_extraction_module/conv7/W/Initializer/truncated_normal:08
å
0shadow_net/feature_extraction_module/bn7/gamma:05shadow_net/feature_extraction_module/bn7/gamma/Assign5shadow_net/feature_extraction_module/bn7/gamma/read:02Ashadow_net/feature_extraction_module/bn7/gamma/Initializer/ones:08
â
/shadow_net/feature_extraction_module/bn7/beta:04shadow_net/feature_extraction_module/bn7/beta/Assign4shadow_net/feature_extraction_module/bn7/beta/read:02Ashadow_net/feature_extraction_module/bn7/beta/Initializer/zeros:08
ü
6shadow_net/feature_extraction_module/bn7/moving_mean:0;shadow_net/feature_extraction_module/bn7/moving_mean/Assign;shadow_net/feature_extraction_module/bn7/moving_mean/read:02Hshadow_net/feature_extraction_module/bn7/moving_mean/Initializer/zeros:0

:shadow_net/feature_extraction_module/bn7/moving_variance:0?shadow_net/feature_extraction_module/bn7/moving_variance/Assign?shadow_net/feature_extraction_module/bn7/moving_variance/read:02Kshadow_net/feature_extraction_module/bn7/moving_variance/Initializer/ones:0
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_0/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/fw/lstm_cell/bias/Initializer/zeros:08
Ä
eshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel:0jshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Assignjshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/read:02shadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/kernel/Initializer/random_uniform:08
²
cshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias:0hshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Assignhshadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/read:02ushadow_net/sequence_rnn_module/stack_bidirectional_rnn/cell_1/bidirectional_rnn/bw/lstm_cell/bias/Initializer/zeros:08
¹
"shadow_net/sequence_rnn_module/w:0'shadow_net/sequence_rnn_module/w/Assign'shadow_net/sequence_rnn_module/w/read:02?shadow_net/sequence_rnn_module/w/Initializer/truncated_normal:08*Ö
outputsÊ
4
input_tensor$
input_tensor:0 dv

predictionh	ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"H
CTCBeamSearchDecoder:1CTCBeamSearchDecoder:0CTCBeamSearchDecoder:2tensorflow/serving/predict