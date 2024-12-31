Global Functions
Last modified: 25 December 2024
Below is a list of all global functions. By “global”, we mean these functions do not require a preceding namespace - so you can call them directly, unlike other functions.

print
Function
Prints text to game's console.

Arguments

Name

Type

Description

text

string

String to print in the console.

Returns

Nothing.

Example

print('Hello world!'); -- prints out "Hello world!" to the console
error
Function
Prints an error text to game's console, and shuts down the script. Try to avoid using this function - use it only if an error happens which you can't recover from.

Arguments

Name

Type

Description

text

string

Read print for documentation.

Returns

Nothing.

Example

error('Can't recover from this one! Error: ' .. tostring(123));

ptr
Last modified: 25 December 2024
This type is a literal pointer.

To preserve interoperability with C++, several functions return void* as the type, which then get converted to light_userdata. Since you can’t directly cast FFI types to light_userdata, we’ve introduced a specialized type helping with this conversion.

Before you convert your pointer to one that is supported by the API, you need to cast it to uintptr_t. This can be done in the following manner:

local ptr_num = ffi.cast('uintptr_t', ptr_cdata);
Then, you can use the cast value in this type's constructor.

__call
Constructor
Converts a number to pointer.

Arguments

Name

Type

Description

num

int

Pointer, as number.

Returns

Type

Description

ptr

Pointer, as light_userdata.

Example

-- cast to number first
local ptr_num = ffi.cast('uintptr_t', ptr_cdata);

-- then cast to light_userdata
local ptr_ld = ptr(ptr_num);

vector
Last modified: 25 December 2024
This type is a common 3D vector (x, y, z).

This type supports operations, such as +, -, /, * and ==.

x
Field
Type: float

X coordinate.

y
Field
Type: float

Y coordinate.

z
Field
Type: float

Z coordinate.

__call
Constructor
Constructs a vector.

Arguments

1. Default vector (0, 0, 0).

None.

2. Single value.

Name

Type

Description

value

float

X and Y coordinates.

3. XYZ values.

Name

Type

Description

x

float

X coordinate.

y

float

Y coordinate.

z

float

Z coordinate.

Returns

Type

Description

vector

Vector.

Example

local vec = vector(5, 25, 12);
is_zero
Method
Returns true if this vector is within tolerance range.

Arguments

Name

Type

Description

tolerance

float

Max allowed tolerance. Defaults to 0.01.

Returns

Type

Description

bool

true if ranges between -tolerance and tolerance.

Example

local vec = vector(0, 0.1, 0.5);
print(tostring(vec:is_zero(1))); -- will print 'true', because every value fits in the range of -1 and 1
dist
Method
Returns distance to another vector.

Arguments

Name

Type

Description

other

vector

Vector to calculate distance against.

Returns

Type

Description

float

Distance to other vector.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
print(tostring(vec1:dist(vec2)));
dist_sqr
Method
Returns squared distance to another vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

Name

Type

Description

other

vector

Vector to calculate distance against.

Returns

Type

Description

float

Squared distance to other vector.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
print(tostring(vec1:dist_sqr(vec2)));
dist_2d
Method
Returns 2D (only x and y values) distance to another vector.

Arguments

Name

Type

Description

other

vector

Vector to calculate distance against.

Returns

Type

Description

float

Distance to other vector.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
print(tostring(vec1:dist_2d(vec2)));
dist_2d_sqr
Method
Returns squared 2D (only x and y values) distance to another vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

Name

Type

Description

other

vector

Vector to calculate distance against.

Returns

Type

Description

float

Squared distance to other vector.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
print(tostring(vec1:dist_2d_sqr(vec2)));
cross
Method
Returns a cross product to another vector.

Arguments

Name

Type

Description

other

vector

Vector to calculate cross product against.

Returns

Type

Description

vector

Cross product.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
local cross = vec1:cross(vec2);
is_valid
Method
Returns true if all values in this vector are finite.

Arguments

None.

Returns

Type

Description

bool

true if values are finite.

Example

local vec = vector(5, 1, 6);
if vec:is_valid() then
    -- ...
end
length
Method
Returns length of this vector.

Arguments

None.

Returns

Type

Description

float

Length of this vector.

Example

local vec = vector(5, 1, 6);
local length = vec:length();
length_sqr
Method
Returns squared length of this vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

None.

Returns

Type

Description

float

Length of this vector.

Example

local vec = vector(5, 1, 6);
local length = vec:length_sqr();
length_2d
Method
Returns 2D length of this vector.

Arguments

None.

Returns

Type

Description

float

Length of this vector.

Example

local vec = vector(5, 1, 6);
local length = vec:length_2d();
length_2d_sqr
Method
Returns squared 2D length of this vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

None.

Returns

Type

Description

float

Length of this vector.

Example

local vec = vector(5, 1, 6);
local length = vec:length_2d_sqr();
dot
Method
Returns dot product of 2 vectors.

Arguments

Name

Type

Description

other

vector

Vector to calculate dot product against.

Returns

Type

Description

float

Dot product.

Example

local vec1 = vector(0, 0, 0);
local vec2 = vector(1, 1, 5);
local dot = vec1:dot(vec2);

color
Last modified: 25 December 2024
This type is a color used within the game.

Do not mistake this type with color that is used for rendering! While these types are interchangeable internally, they are NOT in the API.

cview_setup
Last modified: 25 December 2024
Describes view setup parameters.

fov
Field
Type: float

Current FOV (Field of View).

fov_viewmodel
Field
Type: float

Current viewmodel's FOV.

origin
Field
Type: vector

Current view origin.

view
Field
Type: vector

Current view angles.

aspect_ratio
Field
Type: float

Current aspect ratio (width / height) of the view.

game_event_t
Last modified: 25 December 2024
Describes a game event.

get_name
Method
Returns the event name.

Arguments

None.

Returns

Type

Description

string

Event name.

Example

if event:get_name() == 'player_hurt' then
    -- ...
end
get_bool
Method
Returns the boolean value by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

bool

Entry value. Returns false if such key was not found.

Example

event:get_bool('some_key');
get_int
Method
Returns the integer value by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

int

Entry value. Returns 0 if such key was not found.

Example

event:get_int('some_key');
get_float
Method
Returns the float value by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

float

Entry value. Returns 0.0 if such key was not found.

Example

event:get_float('some_key');
get_string
Method
Returns the string value by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

string

Entry value. Returns '' if such key was not found.

Example

event:get_string('some_key');
get_controller
Method
Returns the controller by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

cs2_player_controller

Controller.

Example

event:get_controller('userid');
get_pawn_from_id
Method
Returns the pawn by key.

Arguments

Name

Type

Description

key

string

Entry key.

Returns

Type

Description

cs2_player_pawn

Pawn.

Example

event:get_pawn_from_id('userid');

ref_holder_t
Last modified: 25 December 2024
This type acts as a proxy for reference variables that are used internally. Since Lua is a value-only language, it does not support references. Instead, an instance of this type is used to preserve interoperability with C++.

Note that <type> indicates the specific type this instance holds. For example, if you see ref_holder_t<float>, it means the val field holds a float value and will only accept float values when it’s updated.

val
Field
Type: <type>

Value holder. Use as the source value, or override it to change internally.

Common Enums
Last modified: 25 December 2024
In this section, the most common enums are listed, that are not particularly bound to a service or module.

Common Types
Last modified: 25 December 2024
In this section, you’ll find the most common types that aren’t tied to any specific service or module.

ref_holder_t
Last modified: 25 December 2024
This type acts as a proxy for reference variables that are used internally. Since Lua is a value-only language, it does not support references. Instead, an instance of this type is used to preserve interoperability with C++.

Note that <type> indicates the specific type this instance holds. For example, if you see ref_holder_t<float>, it means the val field holds a float value and will only accept float values when it’s updated.

val
Field
Type: <type>

Value holder. Use as the source value, or override it to change internally.

client_frame_stage
Last modified: 25 December 2024
Contains keys for various frame rendering stages.

undefined
Field
This describes a stage that is not defined. You should realistically never receive this type.

start
Field
Frame build process is starting.

render_start
Field
Frame render process is starting.

net_update_start
Field
Network update process is starting.

net_update_preprocess
Field
Network update is about to be processed by the engine.

net_pre_entity_packet
Field
Incoming entity packets are about to be processed by the game.

net_update_postdataupdate_start
Field
Entity information is about to be updated.

net_update_postdataupdate_end
Field
Entity information is about to finish updating.

net_update_end
Field
Network update process is ending.

net_creation
Field
New entities are about to be created.

render_end
Field
Frame rendering process is ending.

input_type_t
Last modified: 25 December 2024
Contains keys for value input options.

yaw
Field
Yaw (Y coordinate) input. This means the mouse is moving horizontally.

pitch
Field
Pitch (X coordinate) input. This means the mouse is moving vertically.

scroll
Field
Scroll input. This means that the mouse wheel is being scrolled.

math
Last modified: 25 December 2024
Usage:

math.{func}
This table extends the existing math table that is a part of Lua.

calc_angle
Function
Calculates angles between 2 vectors.

Arguments

Name

Type

Description

src

vector

Source vector.

dst

vector

Destination vector.

Returns

Type

Description

vector

Angles.

Example

local ang = math.calc_angle(vec1, vec2);
angle_normalize
Function
Normalizes an angle.

Arguments

Name

Type

Description

angle

float

Input angle.

Returns

Type

Description

float

Normalized angle.

Example

local norm = math.angle_normalize(560);
approach_angles
Function
Approaches an angle over time.

Arguments

Name

Type

Description

from

vector

Start angle.

to

vector

End angle.

speed

float

Approach speed.

Returns

Type

Description

vector

Delta angle.

Example

local ang = math.approach_angles(from, to, 1.0 / game.global_vars.frametime);
edge_point
Function
Returns a point on the edge of a box.

Arguments

Name

Type

Description

mins

vector

Box mins.

maxs

vector

Box maxs.

dir

vector

Point direction (angle).

radius

float

Area radius.

Returns

Type

Description

vector

Point.

Example

local point = math.edge_point(mins, maxs, dir, 5);
lerp
Function
Linear interpolation.

Arguments

Name

Type

Description

t1

float

Start value.

t2

float

End value.

progress

float

Interpolation amount.

Returns

Type

Description

float

Interpolated value.

Example

local mid = math.lerp(0, 100, 0.5);
vector_angles
Function
Calculates angles from a vector.

Arguments

Name

Type

Description

forward

vector

Source vector.

up

vector

Up vector. Defaults to nil.

Returns

Type

Description

vector

Angles.

Example

local ang = math.vector_angles(fw);
world_to_screen
Function
Transforms a point in the game world onto the viewport.

Arguments

Name

Type

Description

xyz

vector

Point in the world.

round

bool

Whether should round the output. Defaults to true.

Returns

Type

Description

vec2

Point on the viewport.

Example

local point = math.world_to_screen(game_point);
clamp
Function
Clamps a value between min and max.

Arguments

Name

Type

Description

n

float

Value.

lower

float

Lowest value.

upper

float

Highest value.

Returns

Type

Description

float

Clamped value.

Example

local x = math.clamp(50, 5, 25); -- 25
remap_val
Function
Maps the value from one range to another range.

Arguments

Name

Type

Description

val

float

Value.

a

float

Lowest source value.

b

float

Highest source value.

c

float

Lowest destination value.

d

float

Highest destination value.

Returns

Type

Description

float

Mapped value.

Example

local mapped = math.remap_val(0.5, 0, 1, 0, 100); -- 50
remap_val_clamped
Function
Maps the value from one range to another range. Additionally, clamps the value based on the source range.

Arguments

Name

Type

Description

val

float

Value.

a

float

Lowest source value.

b

float

Highest source value.

c

float

Lowest destination value.

d

float

Highest destination value.

Returns

Type

Description

float

Mapped value.

Example

local mapped = math.remap_val_clamped(5, 0, 1, 0, 100); -- 100
vec2
Function
An alias to draw.vec2().

Example

local vec = math.vec2(5, 5);
vec3
Function
An alias to vector().

Example

local vec = math.vec3(5, 12, 5);

events
Last modified: 25 December 2024
Usage:

events.{event_name}
There are a number of events that Fatality provides to use in the API - from various hooks, to in-game events. Each event entry is an object of event_t. This table documents events to be used by your scripts.

You are not required to remove events when your script unloads. It is done automatically by the API engine.

present_queue
Field
Invoked each time the game queues a frame for rendering. This is the only permitted location for drawing on screen.

Arguments

None.

frame_stage_notify
Field
Invoked every time the game progresses onto another frame stage. This event is called before the game handles a new frame stage.

Arguments

Name

Type

Description

stage

client_frame_stage

Current frame stage.

render_start_pre
Field
Invoked every time game starts the scene rendering process. This event is called before the game's function runs.

Arguments

None.

render_start_post
Field
Invoked every time game starts scene rendering process. This event is called after the game's function runs.

Arguments

Name

Type

Description

setup

cview_setup

View setup information.

setup_view_pre
Field
Invoked every time the game sets up the view. This event is called before the game's function runs.

Arguments

None.

setup_view_post
Field
Invoked every time the game sets up the view information. This event is called after the game's function runs.

You can retrieve the view information from game.view_render service.

Arguments

None.

override_view
Field
Invoked every time the game internally overrides view information. You are free to change whatever you like in the provided view setup.

Arguments

Name

Type

Description

setup

cview_setup

View setup information.

event
Field
Invoked every time a game event fires.

We do not listen to every single event that exists in the game. If you need something that we don't listen to, please use mods.events

Arguments

Name

Type

Description

event

game_event_t

Game event.

handle_input
Field
Invoked every time the game processes mouse/controller input. This is a good place to alter mouse movement, if needed.

Arguments

Name

Type

Description

type

input_type_t

Type of the input.

value

ref_holder_t<float>

Input value.

event_t
Last modified: 25 December 2024
Event usertype. An instance of this type can be found in events.

add
Method
Adds a callback to the event.

Arguments

Name

Type

Description

fn

function

Callback function. Arguments that are accepted by the function are dictated by the event instance.

Returns

Nothing.

Example

events.present_queue:add(function ()
    -- will be called every time game queues a frame for rendering
end);
remove
Method
Removes a callback from the event.

Arguments

Name

Type

Description

fn

function

Callback function, that was earlier passed to the add() function.

Returns

Nothing.

Example

local function on_present()
    if some_condition then
        events.present_queue:remove(on_present)
    end
end

events.present_queue:add(on_present)

game
Last modified: 25 December 2024
Usage:

game.{interface_or_function}
This table exposes various internal services and global objects used by Fatality, and also provides a way to retrieve any additional services you need.

global_vars
Field
Type: global_vars_t

This service exposes global variables used by the game, such as frame time or current server time.

engine
Field
Type: cengine_client

This service exposes the engine client, which includes commonly used engine-related functions.

global_vars_t
Last modified: 25 December 2024
Usage:

game.global_vars.{field}
An instance of this type provides a way to read several global variables that are used by the game. Changing any of the values is not and will never be supported.

real_time
Field
Type: float

Time passed since the game start, in seconds.

frame_count
Field
Type: int

Amount of frames rendered since the game start.

abs_frame_time
Field
Type: float

Absolute (averaged) frame time. It is calculated over a set of previous frame times, and should not be used for anything that requires accurate frame time like animation.

max_clients
Field
Type: int

Maximum amount of clients on the current server.

ticks_this_frame
Field
Type: int

Amount of ticks passed during the currently rendered frame. Any value above 1 might indicate a stall during rendering.

frame_time
Field
Type: float

Time, in which a previous frame was rendered. May be used for animation or by any other means that require accurate frame time.

cur_time
Field
Type: float

Time passed since the server's game start. This does not indicate the accurate time on the server, although in several events it might be synced by the software.

tick_fraction
Field
Type: float

Current tick's fractional value.

tick_count
Field
Type: int

Ticks passed since the server's game start.

map_path
Field
Type: string

Relative path to current loaded map's file.

map_name
Field
Type: string

Name of the currently loaded map.

cengine_client
Last modified: 25 December 2024
Usage:

game.engine.{method}
An instance of this type provides a way to interface with Source 2's Engine-to-Client service.

get_last_timestamp
Method
Returns last timestamp, in seconds.

Arguments

None.

Returns

Type

Description

float

Timestamp, in seconds.

Example

local last_time = game.engine:get_last_timestamp();
get_last_server_tick
Method
Returns last server tick number.

Arguments

None.

Returns

Type

Description

int

Server tick number.

Example

local server_tick = game.engine:get_last_server_tick();
in_game
Method
Returns whether the client is currently in game.

Arguments

None.

Returns

Type

Description

bool

In-game status.

Example

if game.engine:in_game() then
    print("I'm in game!");
end
is_connected
Method
Returns whether the client is currently connected to a game server.

Arguments

None.

Returns

Type

Description

bool

true if connected.

Example

if game.engine:is_connected() then
    print("I'm connected!");
end
get_netchan
Method
Returns the Network Channel used for network communication.

Arguments

None.

Returns

Type

Description

cnet_chan

Network channel, or nil if does not exist.

Example

local chan = game.engine:get_netchan();
client_cmd
Method
Executes a client-sided console command.

Arguments

Name

Type

Description

cmd

string

Command to execute.

bool

unrestricted

Whether should the execution preserve any restrictions. Defaults to false.

Returns

Nothing.

Example

game.engine:client_cmd('say Hello!');
get_screen_size
Method
Returns client window screen size.

Arguments

None.

Returns

Type

Description

int

Width.

int

Height.

Example

local w, h = game.engine:get_screen_size();

cnet_chan
Last modified: 25 December 2024
Provides a way to interface with a Network Channel's class.

get_address
Method
If the current channel is null, this function will return nil instead.

Returns address string of the remote machine.

Arguments

None.

Returns

Type

Description

string?

IP-address or Steam Server Address.

Example

local chan = game.engine:get_netchan();
if chan and not chan:is_null() then
    print(chan:get_address());
end
is_loopback
Method
If the current channel is null, this function will return nil instead.

Returns whether the current channel is connected to the local machine (loopback address).

Arguments

None.

Returns

Type

Description

bool?

true if connected to the local machine.

Example

local chan = game.engine:get_netchan();
if chan and not chan:is_null() and chan:is_loopback() then
    print('Connected to localhost!');
end
is_null
Method
Returns whether the channel is stubbed.

Arguments

None.

Returns

Type

Description

bool

true if current channel is a dummy channel.

Example

local chan = game.engine:get_netchan();
if not chan or chan:is_null() then
    print('Not connected!');
end
get_latency
Method
If the current channel is null, this function will return nil instead.

Returns current latency to the remote server (in seconds).

Arguments

None.

Returns

Type

Description

float?

Latency (in seconds).

Example

local chan = game.engine:get_netchan();
if chan and not chan:is_null() then
    print('Current latency: ' .. tostring(math.round(chan:get_latency() * 1000.0)) .. 'ms');
end

mods
Last modified: 25 December 2024
Usage:

mods.{mod_name}
This table exposes several mods (short for Module, not Modification), that Fatality uses to operate.

events
Field
Type: events_t

Event manager. Use this mod if you want to listen to more in-game events.

events_t
Last modified: 25 December 2024
Usage:

mods.events.{method}
This module lets you manage custom in-game event listener.

Please note that the game server knows which events you are listening to. Internally, we only listen to events that will get sent to the client anyway in one way or another. If you decide to listen to something the server generally does not expect, it may cause issues on official servers.

add_listener
Method
Adds a game event to the listener.

Internally we listen to the following events:

player_hurt

item_purchase

bullet_impact

weapon_fire

bomb_beginplant

bomb_abortplant

bomb_planted

bomb_defused

bomb_exploded

round_start

game_newmap

map_shutdown

Adding those events to the listener is not needed.

Arguments

Name

Type

Description

name

string

Event name.

Returns

Nothing.

Example

mods.events:add_listener('round_end');

entities
Last modified: 25 December 2024
This table represents an internal entity list.

Never store any entities in the global scope! Any entity might get deleted, and you will no longer have a valid instance of that entity, which will inevitably lead to a crash. If you need to globally store an entity somewhere, we strongly recommend you store an instance of chandle, and use it's get method to retrieve the entity again, when needed.

players
Field
Type: entity_list_t<cs2_player_pawn>

Player pawns.

controllers
Field
Type: entity_list_t<cs2_player_controller>

Player controllers.

items
Field
Type: entity_list_t<cs2_weapon_base>

Items (held).

dropped_items
Field
Type: entity_list_t<cs2_weapon_base>

Dropped items.

projectiles
Field
Type: entity_list_t<cs2_grenade_projectile>

Grenade projectiles.

get_local_pawn
Function
Returns the local player's pawn.

Arguments

None.

Returns

Type

Description

cs2_player_pawn

Pawn.

Example

local lp = entities.get_local_pawn();
get_local_controller
Function
Returns the local player's controller.

Arguments

None.

Returns

Type

Description

cs2_player_controller

Controller.

Example

local lp_ctrl = entities.get_local_controller();

entity_list_t
Last modified: 25 December 2024
This type represents an entity list.

Never save any entities you get from this list if you don't know what you are doing! You may be left with dangling pointers, which will inevitably lead to a crash.

for_each
Method
Loops the entities.

Arguments

Name

Type

Description

fn

function(entity_entry_t)

Function callback.

Returns

Nothing.

Example

entities.players:for_each(function (entry)
    -- ...
end);
for_each_z
Method
Loops the entities in the reverse order.

Arguments

Name

Type

Description

fn

function(entity_entry_t)

Function callback.

Returns

Nothing.

Example

entities.players:for_each_z(function (entry)
    -- ...
end);

entity_entry_t
Last modified: 25 December 2024
Represents an entity entry.

entity
Field
Type: <type>

Entity instance. Type depends on the list you get it from.

had_dataupdate
Field
Type: bool

true if the client had received any updates to this entity at least once.

handle
Field
Type: chandle<type>

Entity's handle. You may store this elsewhere if you need to have global access to an entity.

avatar
Field
Type: texture

This field is only available on entries that use cs2_player_controller type.

Player's profile picture. Will be nil if was yet to be initialized.

base_entity
Last modified: 25 December 2024
This type represents a base game entity.

This type may be returned for any other abstract entity class, but internally will point to the correct type.

__index
Function
Attemps to search for a field in this class.

Arguments

Name

Type

Description

name

string

Field name.

Returns

Type

Description

schema_accessor_t

Accessor instance.

Example

local health = player.m_iHealth;
local health = player['m_iHealth']; -- this also works

schema_accessor_t
Last modified: 25 December 2024
This type represents a special structure that references a certain field in the entity object.

You can check the returned type by using type() function.

Do not ever store an instance of this type anywhere but in a scope of an event because entity might be removed.

get
Method
Returns the value.

Arguments

None.

Returns

Type

Description

<type>

Value.

Example

local health = player.m_iHealth:get();
set
Method
Sets the value.

Arguments

Name

Type

Description

value

<type>

Value.

Returns

Nothing.

Example

player.m_iHealth:set(50); -- won't really do anything with the health

cs2_weapon_base_gun
Last modified: 25 December 2024
This type represents a CCSWeaponBaseGun class.

This type inherits base_entity type. All of its base methods and fields are also available in this type.

get_abs_origin
Method
Returns the absolute origin (the one that is used for rendering).

Arguments

None.

Returns

Type

Description

vector

Origin.

Example

local org = wep:get_abs_origin();
get_max_speed
Method
Returns the maximal player speed when holding this weapon.

Arguments

None.

Returns

Type

Description

float

Max speed, in UPS.

Example

local spd = wep:get_max_speed();
get_inaccuracy
Method
Returns the current inaccuracy value.

Arguments

Name

Type

Description

mode

csweapon_mode

Weapon mode.

Returns

Type

Description

float

Inaccuracy value.

Example

local inacc = wep:get_inaccuracy(csweapon_mode.primary_mode);
get_spread
Method
Returns the current spread value.

Arguments

Name

Type

Description

mode

csweapon_mode

Weapon mode.

Returns

Type

Description

float

Inaccuracy value.

Example

local spread = wep:get_spread(csweapon_mode.primary_mode);
get_id
Method
Returns the weapon ID.

Arguments

None.

Returns

Type

Description

weapon_id

Weapon ID.

Example

local wep_id = wep:get_id();
get_type
Method
Returns the weapon type.

Arguments

None.

Returns

Type

Description

csweapon_type

Weapon type.

Example

local type = wep:get_type();
get_data
Method
Returns the weapon static data.

Arguments

None.

Returns

Type

Description

ccsweapon_base_vdata

Weapon data.

Example

local data = wep:get_data();
is_gun
Method
Returns true if this weapon is a firearm.

Arguments

None.

Returns

Type

Description

bool

true if a firearm.

Example

if wep:is_gun() then
    -- ...
end
is_attackable
Method
Returns true if you can attack with this weapon.

Arguments

None.

Returns

Type

Description

bool

true if can attack.

Example

if wep:is_attackable() then
    -- ...
end
has_secondary_attack
Method
Returns true if this weapon has a secondary attack mode.

Arguments

None.

Returns

Type

Description

bool

true if has the secondary attack mode.

Example

if wep:has_secondary_attack() then
    -- ...
end
has_spread
Method
Returns true if this weapon has spread (e.g. knives do not have any spread).

Arguments

None.

Returns

Type

Description

bool

true if has spread.

Example

if wep:has_spread() then
    -- ...
end

cs2_player_pawn
Last modified: 25 December 2024
This type represents a C_CSPlayerPawn class.

This type inherits base_entity type. All of its base methods and fields are also available in this type.

should_draw
Method
Returns true if the game will draw this player on screen.

Arguments

None.

Returns

Type

Description

bool

true if will.

Example

if player:should_draw() then
    -- ...
end
is_left_handed
Method
Returns true if left-hand mode is enabled.

Arguments

None.

Returns

Type

Description

bool

true if left-handed.

Example

if player:is_left_handed() then
    -- ...
end
get_abs_origin
Method
Returns the absolute origin (the one that is used for rendering).

Arguments

None.

Returns

Type

Description

vector

Origin.

Example

local org = player:get_abs_origin();
get_abs_angles
Method
Returns the absolute angles (the one that is used for rendering).

Arguments

None.

Returns

Type

Description

vector

Angles.

Example

local ang = player:get_abs_angles();
set_abs_origin
Method
Sets the new absolute origin.

Arguments

Name

Type

Description

vec

vector

New origin.

Returns

Nothing.

Example

player:set_abs_origin(my_vec);
set_abs_angles
Method
Sets new absolute angles.

Arguments

Name

Type

Description

ang

vector

New angles.

Returns

Nothing.

Example

player:set_abs_angles(my_ang);
is_alive
Method
Returns true if the player is alive.

Arguments

None.

Returns

Type

Description

bool

true if alive.

Example

if player:is_alive() then
    -- ...
end
is_enemy
Method
Returns true if this player is an enemy to the local player.

Arguments

None.

Returns

Type

Description

bool

true if an enemy.

Example

if player:is_enemy() then
    -- ...
end
is_enemy_to
Method
Returns whether this player is an enemy to another entity.

Arguments

Name

Type

Description

ent

base_entity

Other entity.

Returns

Type

Description

bool

true if an enemy.

Example

if player:is_enemy_to(other_player) then
    -- ...
end
get_active_weapon
Method
Returns the active weapon.

Arguments

None.

Returns

Type

Description

cs2_weapon_base_gun

Weapon instance.

Example

local wep = player:get_active_weapon();
get_name
Method
Returns the sanitized player name.

Arguments

None.

Returns

Type

Description

string

Player's name.

Example

local name = player:get_name();
get_view_offset
Method
Returns the player's view offset (eye location relative to the player's origin).

Arguments

None.

Returns

Type

Description

vector

View offset.

Example

local vo = player:get_view_offset();
get_eye_pos
Method
Returns the player's eye position.

Arguments

None.

Returns

Type

Description

vector

Eye position.

Example

local eyes = player:get_eye_pos();

cs2_player_controller
Last modified: 25 December 2024
This type represents a CCSPlayerController class.

This type inherits base_entity type. All of its base methods and fields are also available in this type.

is_enemy
Method
Returns true if this player is an enemy to the local player.

Arguments

None.

Returns

Type

Description

bool

true if an enemy.

Example

if player:is_enemy() then
    -- ...
end
get_name
Method
Returns the sanitized player name.

Arguments

None.

Returns

Type

Description

string

Player's name.

Example

local name = player:get_name();
get_pawn
Method
Returns the pawn attached to this controller.

Arguments

None.

Returns

Type

Description

cs2_player_pawn

Pawn instance.

Example

local pawn = ctrl:get_pawn();
get_active_weapon
Method
Returns the active weapon.

Arguments

None.

Returns

Type

Description

cs2_weapon_base_gun

Weapon instance.

Example

local wep = player:get_active_weapon();
get_observer_pawn
Method
Returns the observer pawn used for this controller.

Arguments

None.

Returns

Type

Description

base_entity

Entity.

Example

local obs_pawn = ctrl:get_observer_pawn();
get_observer_target
Method
Returns the pawn this controller is currently observing.

Arguments

None.

Returns

Type

Description

base_entity

Entity.

Example

local obs = ctrl:get_observer_target();
get_observer_mode
Method
Returns the current observer mode.

Arguments

None.

Returns

Type

Description

observer_mode_t

Observer mode.

Example

local mode = ctrl:get_observer_mode();

cs2_player_controller
Last modified: 25 December 2024
This type represents a CCSPlayerController class.

This type inherits base_entity type. All of its base methods and fields are also available in this type.

is_enemy
Method
Returns true if this player is an enemy to the local player.

Arguments

None.

Returns

Type

Description

bool

true if an enemy.

Example

if player:is_enemy() then
    -- ...
end
get_name
Method
Returns the sanitized player name.

Arguments

None.

Returns

Type

Description

string

Player's name.

Example

local name = player:get_name();
get_pawn
Method
Returns the pawn attached to this controller.

Arguments

None.

Returns

Type

Description

cs2_player_pawn

Pawn instance.

Example

local pawn = ctrl:get_pawn();
get_active_weapon
Method
Returns the active weapon.

Arguments

None.

Returns

Type

Description

cs2_weapon_base_gun

Weapon instance.

Example

local wep = player:get_active_weapon();
get_observer_pawn
Method
Returns the observer pawn used for this controller.

Arguments

None.

Returns

Type

Description

base_entity

Entity.

Example

local obs_pawn = ctrl:get_observer_pawn();
get_observer_target
Method
Returns the pawn this controller is currently observing.

Arguments

None.

Returns

Type

Description

base_entity

Entity.

Example

local obs = ctrl:get_observer_target();
get_observer_mode
Method
Returns the current observer mode.

Arguments

None.

Returns

Type

Description

observer_mode_t

Observer mode.

Example

local mode = ctrl:get_observer_mode();

cs2_grenade_projectile
Last modified: 25 December 2024
This type represents a grenade projectile.

This type inherits base_entity type. All of its base methods and fields are also available in this type.

get_abs_origin
Method
Returns the absolute origin (the one that is used for rendering).

Arguments

None.

Returns

Type

Description

vector

Origin.

Example

local org = wep:get_abs_origin();
get_grenade_type
Method
Returns the grenade type.

Arguments

None.

Returns

Type

Description

int

Grenade type.

Example

local type = gren:get_grenade_type();

ccsweapon_base_vdata
Last modified: 25 December 2024
This type represents a weapon's static data.

built_right_handed
Field
Read Only
Type: bool

Indicates whether the weapon is designed for right-handed use.

allow_flipping
Field
Read Only
Type: bool

Indicates whether the weapon can be flipped for left-handed use.

linked_cooldowns
Field
Read Only
Type: bool

Indicates whether the weapon's cooldowns are linked with other weapons.

flags
Field
Read Only
Type: int

Represents various flags associated with the weapon.

primary_ammo_type
Field
Read Only
Type: int

The type of ammo used in the primary clip.

secondary_ammo_type
Field
Read Only
Type: int

The type of ammo used in the secondary clip.

max_clip1
Field
Read Only
Type: int

The maximum number of rounds the primary clip can hold.

max_clip2
Field
Read Only
Type: int

The maximum number of rounds the secondary clip can hold.

default_clip1
Field
Read Only
Type: int

The default number of rounds in the primary clip.

default_clip2
Field
Read Only
Type: int

The default number of rounds in the secondary clip.

reserve_ammo_as_clips
Field
Read Only
Type: bool

Indicates whether reserve ammo is stored as additional clips.

weight
Field
Read Only
Type: int

Represents the weight of the weapon.

auto_switch_to
Field
Read Only
Type: bool

Indicates whether the game will automatically switch to this weapon when picked up.

auto_switch_from
Field
Read Only
Type: bool

Indicates whether the game will automatically switch away from this weapon.

rumble_effect
Field
Read Only
Type: int

Represents the rumble effect associated with this weapon.

slot
Field
Read Only
Type: int

The inventory slot this weapon occupies.

position
Field
Read Only
Type: int

The position of the weapon in the inventory slot.

weapon_type
Field
Read Only
Type: csweapon_type

The type of the weapon.

weapon_category
Field
Read Only
Type: csweapon_category

The category of the weapon.

gear_slot
Field
Read Only
Type: int

Represents the gear slot associated with the weapon.

gear_slot_position
Field
Read Only
Type: int

The position of the weapon in the gear slot.

default_loadout_slot
Field
Read Only
Type: int

The default loadout slot for the weapon.

s_wrong_team_msg
Field
Read Only
Type: string

The message displayed when the weapon is used by the wrong team.

price
Field
Read Only
Type: int

The purchase price of the weapon.

kill_award
Field
Read Only
Type: int

The cash reward given to the player for a kill with this weapon.

primary_reserve_ammo_max
Field
Read Only
Type: int

The maximum amount of reserve ammo for the primary clip.

secondary_reserve_ammo_max
Field
Read Only
Type: int

The maximum amount of reserve ammo for the secondary clip.

melee_weapon
Field
Read Only
Type: bool

Indicates whether the weapon is classified as a melee weapon.

has_burst_mode
Field
Read Only
Type: bool

Indicates whether the weapon has a burst fire mode.

is_revolver
Field
Read Only
Type: bool

Indicates whether the weapon is classified as a revolver.

cannot_shoot_underwater
Field
Read Only
Type: bool

Indicates whether the weapon cannot be fired underwater.

name
Field
Read Only
Type: string

The internal name of the weapon.

anim_extension
Field
Read Only
Type: string

The animation extension used by the weapon.

e_silencer_type
Field
Read Only
Type: int

Represents the type of silencer compatible with the weapon.

crosshair_min_distance
Field
Read Only
Type: int

The minimum crosshair spread distance for this weapon.

crosshair_delta_distance
Field
Read Only
Type: int

The change in crosshair spread distance when firing.

is_full_auto
Field
Read Only
Type: bool

Indicates whether the weapon is fully automatic.

num_bullets
Field
Read Only
Type: int

The number of bullets fired per shot.

cycle_time
Field
Read Only
Type: cfiring_mode<float>

The time between successive shots.

max_speed
Field
Read Only
Type: cfiring_mode<float>

The maximum movement speed of the player while holding this weapon.

spread
Field
Read Only
Type: cfiring_mode<float>

The base spread of the weapon when fired.

inaccuracy_crouch
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while crouching.

inaccuracy_stand
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while standing.

inaccuracy_jump
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while jumping.

inaccuracy_land
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon upon landing from a jump.

inaccuracy_ladder
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while climbing a ladder.

inaccuracy_fire
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while firing.

inaccuracy_move
Field
Read Only
Type: cfiring_mode<float>

The inaccuracy of the weapon while moving.

recoil_angle
Field
Read Only
Type: cfiring_mode<float>

The angle of recoil for the weapon when fired.

recoil_angle_variance
Field
Read Only
Type: cfiring_mode<float>

The variance in the angle of recoil.

recoil_magnitude
Field
Read Only
Type: cfiring_mode<float>

The magnitude of recoil for the weapon.

recoil_magnitude_variance
Field
Read Only
Type: cfiring_mode<float>

The variance in the magnitude of recoil.

tracer_frequency
Field
Read Only
Type: cfiring_mode<int>

The frequency of tracers visible when firing the weapon.

inaccuracy_jump_initial
Field
Read Only
Type: float

The initial inaccuracy of the weapon upon jumping.

inaccuracy_jump_apex
Field
Read Only
Type: float

The inaccuracy of the weapon at the apex of a jump.

inaccuracy_reload
Field
Read Only
Type: float

The inaccuracy of the weapon after reloading.

recoil_seed
Field
Read Only
Type: int

The seed value used for determining recoil patterns.

spread_seed
Field
Read Only
Type: int

The seed value used for determining weapon spread.

time_to_idle_after_fire
Field
Read Only
Type: float

The time it takes for the weapon to transition to idle after firing.

idle_interval
Field
Read Only
Type: float

The time interval between idle animations for the weapon.

attack_movespeed_factor
Field
Read Only
Type: float

The factor by which the player's movement speed is reduced while attacking with this weapon.

heat_per_shot
Field
Read Only
Type: float

The heat generated by the weapon per shot.

inaccuracy_pitch_shift
Field
Read Only
Type: float

The pitch shift caused by inaccuracy when firing.

inaccuracy_alt_sound_threshold
Field
Read Only
Type: float

The threshold for inaccuracy at which an alternative sound is played.

bot_audible_range
Field
Read Only
Type: float

The range at which bots can hear this weapon being fired.

use_radio_subtitle
Field
Read Only
Type: string

Indicates whether this weapon uses radio subtitles for its actions.

unzooms_after_shot
Field
Read Only
Type: bool

Indicates whether the weapon unzooms automatically after firing.

hide_view_model_when_zoomed
Field
Read Only
Type: bool

Indicates whether the view model is hidden when the weapon is zoomed in.

zoom_levels
Field
Read Only
Type: int

The number of zoom levels available for this weapon.

zoom_fov1
Field
Read Only
Type: int

The field of view (FOV) for the first zoom level.

zoom_fov2
Field
Read Only
Type: int

The field of view (FOV) for the second zoom level.

zoom_time0
Field
Read Only
Type: float

The time it takes to transition to the initial zoom state.

zoom_time1
Field
Read Only
Type: float

The time it takes to transition to the first zoom level.

zoom_time2
Field
Read Only
Type: float

The time it takes to transition to the second zoom level.

iron_sight_pull_up_speed
Field
Read Only
Type: float

The speed at which the weapon's iron sights are pulled up.

iron_sight_put_down_speed
Field
Read Only
Type: float

The speed at which the weapon's iron sights are put down.

iron_sight_fov
Field
Read Only
Type: float

The field of view (FOV) when aiming down the weapon's iron sights.

iron_sight_pivot_forward
Field
Read Only
Type: float

The forward pivot point for the weapon's iron sights.

iron_sight_looseness
Field
Read Only
Type: float

The looseness of the weapon's iron sights when aiming.

ang_pivot_angle
Field
Read Only
Type: vector

The pivot angle for the weapon's iron sights.

vec_iron_sight_eye_pos
Field
Read Only
Type: vector

The eye position when aiming down the weapon's iron sights.

damage
Field
Read Only
Type: int

The base damage dealt by the weapon.

headshot_multiplier
Field
Read Only
Type: float

The multiplier applied to damage for headshots.

armor_ratio
Field
Read Only
Type: float

The ratio determining how much damage penetrates armor.

penetration
Field
Read Only
Type: float

The penetration power of the weapon for materials.

range
Field
Read Only
Type: float

The effective range of the weapon.

range_modifier
Field
Read Only
Type: float

The modifier applied to damage based on range.

flinch_velocity_modifier_large
Field
Read Only
Type: float

The velocity modifier for large flinch effects.

flinch_velocity_modifier_small
Field
Read Only
Type: float

The velocity modifier for small flinch effects.

recovery_time_crouch
Field
Read Only
Type: float

The recovery time for accuracy when crouching.

recovery_time_stand
Field
Read Only
Type: float

The recovery time for accuracy when standing.

recovery_time_crouch_final
Field
Read Only
Type: float

The final recovery time for accuracy when crouching.

recovery_time_stand_final
Field
Read Only
Type: float

The final recovery time for accuracy when standing.

recovery_transition_start_bullet
Field
Read Only
Type: int

The starting bullet count for recovery transition.

recovery_transition_end_bullet
Field
Read Only
Type: int

The ending bullet count for recovery transition.

throw_velocity
Field
Read Only
Type: float

The velocity of thrown items (e.g., grenades).

v_smoke_color
Field
Read Only
Type: vector

The color of smoke effects for this weapon.

anim_class
Field
Read Only
Type: string

The animation class associated with this weapon.

cfiring_mode
Last modified: 25 December 2024
Firing mode information.

values_arr
Field
Read Only
Type: <type>

Values.

chandle
Last modified: 25 December 2024
This type represents an entity handle.

You can also compare this type using a == operator.

get
Method
Returns the entity, or nil if nothing found.

Arguments

None.

Returns

Type

Description

<type>

Entity instance.

Example

local ent = handle:get();
valid
Method
Returns true if the handle is valid.

Arguments

None.

Returns

Type

Description

bool

true if valid.

Example

if handle:valid() then
    -- ...
end
is_clientside
Method
Returns true if the handle links to a client-side entity.

Arguments

None.

Returns

Type

Description

bool

true if client-sided.

Example

if handle:is_clientside() then
    -- ...
end

csweapon_mode
Last modified: 25 December 2024
This enum represents the firing mode for a weapon.

primary_mode
Field
Primary mode (usually left mouse button).

secondary_mode
Field
Secondary mode (usually right mouse button).

csweapon_type
Last modified: 25 December 2024
This enum represents the weapon type in the game.

knife
Field
Represents a knife-type weapon.

pistol
Field
Represents a pistol-type weapon.

submachinegun
Field
Represents a submachine gun-type weapon.

rifle
Field
Represents a rifle-type weapon.

shotgun
Field
Represents a shotgun-type weapon.

sniper_rifle
Field
Represents a sniper rifle-type weapon.

machinegun
Field
Represents a machine gun-type weapon.

c4
Field
Represents a C4 explosive.

taser
Field
Represents a taser weapon.

grenade
Field
Represents a grenade-type weapon.

stackableitem
Field
Represents a stackable item-type weapon.

fists
Field
Represents fists as a weapon type.

breachcharge
Field
Represents a breach charge-type weapon.

bumpmine
Field
Represents a bump mine-type weapon.

tablet
Field
Represents a tablet-type weapon.

melee
Field
Represents a melee-type weapon.

shield
Field
Represents a shield-type weapon.

zone_repulsor
Field
Represents a zone repulsor-type weapon.

unknown
Field
Represents an unknown weapon type.

weapon_id
Last modified: 25 December 2024
This enum represents the unique identifier for various weapons in the game.

none
Field
Represents no weapon.

deagle
Field
Represents a Desert Eagle.

elite
Field
Represents the Dual Berettas.

fiveseven
Field
Represents a Five-SeveN.

glock
Field
Represents a Glock-18.

ak47
Field
Represents an AK-47.

aug
Field
Represents an AUG.

awp
Field
Represents an AWP.

famas
Field
Represents a FAMAS.

g3sg1
Field
Represents a G3SG1.

galilar
Field
Represents a Galil AR.

m249
Field
Represents an M249.

m4a1
Field
Represents an M4A4.

mac10
Field
Represents a MAC-10.

p90
Field
Represents a P90.

zone_repulsor
Field
Represents a zone repulsor device.

mp5sd
Field
Represents an MP5-SD.

ump45
Field
Represents a UMP-45.

xm1014
Field
Represents an XM1014.

bizon
Field
Represents a PP-Bizon.

mag7
Field
Represents a MAG-7.

negev
Field
Represents a Negev.

sawedoff
Field
Represents a Sawed-Off.

tec9
Field
Represents a Tec-9.

taser
Field
Represents a Zeus x27 taser.

hkp2000
Field
Represents a P2000.

mp7
Field
Represents an MP7.

mp9
Field
Represents an MP9.

nova
Field
Represents a Nova.

p250
Field
Represents a P250.

shield
Field
Represents a shield.

scar20
Field
Represents a SCAR-20.

sg556
Field
Represents an SG 553.

ssg08
Field
Represents an SSG 08.

knifegg
Field
Represents the Golden Knife.

knife
Field
Represents the default knife.

flashbang
Field
Represents a flashbang.

hegrenade
Field
Represents an HE grenade.

smokegrenade
Field
Represents a smoke grenade.

molotov
Field
Represents a Molotov.

decoy
Field
Represents a decoy grenade.

incgrenade
Field
Represents an incendiary grenade.

c4
Field
Represents a C4 explosive.

healthshot
Field
Represents a health shot.

knife_t
Field
Represents the Terrorist knife.

m4a1_silencer
Field
Represents the M4A1-S.

usp_silencer
Field
Represents the USP-S.

cz75a
Field
Represents a CZ75-Auto.

revolver
Field
Represents an R8 Revolver.

tagrenade
Field
Represents a tactical awareness grenade.

fists
Field
Represents fists.

breachcharge
Field
Represents a breach charge.

tablet
Field
Represents a tablet.

melee
Field
Represents a generic melee weapon.

axe
Field
Represents an axe.

hammer
Field
Represents a hammer.

spanner
Field
Represents a spanner (wrench).

knife_ghost
Field
Represents a ghost knife.

firebomb
Field
Represents a firebomb grenade.

diversion
Field
Represents a diversion device.

fraggrenade
Field
Represents a fragmentation grenade.

snowball
Field
Represents a snowball.

bumpmine
Field
Represents a bump mine.

knife_bayonet
Field
Represents a Bayonet.

knife_css
Field
Represents the Classic Knife.

knife_flip
Field
Represents a Flip Knife.

knife_gut
Field
Represents a Gut Knife.

knife_karambit
Field
Represents a Karambit.

knife_m9bayonet
Field
Represents an M9 Bayonet.

knife_tactical
Field
Represents a Huntsman Knife.

knife_falchion
Field
Represents a Falchion Knife.

knife_survival_bowie
Field
Represents a Bowie Knife.

knife_butterfly
Field
Represents a Butterfly Knife.

knife_push
Field
Represents a Shadow Daggers.

knife_cord
Field
Represents a Paracord Knife.

knife_canis
Field
Represents a Survival Knife.

knife_ursus
Field
Represents an Ursus Knife.

knife_gypsy_jackknife
Field
Represents a Navaja Knife.

knife_outdoor
Field
Represents a Nomad Knife.

knife_stiletto
Field
Represents a Stiletto Knife.

knife_widowmaker
Field
Represents a Talon Knife.

knife_skeleton
Field
Represents a Skeleton Knife.

knife_kukri
Field
Represents a Kukri Knife.

csweapon_category
Last modified: 25 December 2024
This enum represents the category classification for weapons in the game.

other
Field
Represents weapons or items that don't fit into any specific category.

melee
Field
Represents melee weapons, such as knives or other close-combat tools.

secondary
Field
Represents secondary weapons, such as pistols.

smg
Field
Represents submachine guns (SMGs).

rifle
Field
Represents rifles, including assault rifles and sniper rifles.

heavy
Field
Represents heavy weapons, such as machine guns and shotguns.

observer_mode_t
Last modified: 25 December 2024
This enum represents the observer modes available in the game.

none
Field
Represents no observer mode (not spectating anyone).

fixed
Field
Represents a fixed camera position.

in_eye
Field
Represents observing from the perspective of the player being spectated.

chase
Field
Represents a chase camera that follows the player being spectated.

roaming
Field
Represents a free-roaming camera.

directed
Field
Represents an automatically directed camera, typically controlled by the game or server.

draw
Last modified: 25 December 2024
Usage:

draw.{func_or_field}
This table describes the rendering system of the software.

All types and enums described in the child sections must be prefixed with draw.. This is done so specific types are not confused with others, such as the separate color types present in rendering and the game.

adapter
Field
Read Only
Type: adapter

Rendering adapter.

frame_time
Field
Read Only
Type: float

Rendering frame time. An alias to global_vars_t.frame_time.

time
Field
Read Only
Type: float

Time, in seconds. An alias to global_vars_t.real_time.

scale
Field
Read Only
Type: float

Global DPI scale.

display
Field
Read Only
Type: vec2

Display area size (viewport dimensions). cengine_client:get_screen_size will return exactly the same values. Overriding any of this vector's values will lead to an undefined behavior.

textures
Field
Read Only
Type: accessor<texture>

A string to texture map of all managed textures. You can query and push textures with custom IDs. When you add a texture to this map, it will be automatically destroyed and recreated when required (such as when DX11 device gets lost).

Built-in textures:

gui_loading: loading spinner

gui_user_avatar: current user's profile picture. May be nil if you don't have any avatar set

gui_icon_up: up chevron

gui_icon_down: down chevron

gui_icon_copy: copy icon

gui_icon_paste: paste icon

gui_icon_add: add icon

gui_icon_search: search icon

gui_icon_settings: settings icon (a cogwheel)

gui_icon_bug: bug icon

gui_icon_key.N: keyboard/mouse key icons. Replace N with the char code of a required button

icon_rage: RAGE tab icon

icon_legit: LEGIT tab icon

icon_visuals: VISUALS tab icon

icon_misc: MISC tab icon

icon_scripts: LUA tab icon

icon_skins: SKINS tab icon

icon_cloud: cloud icon

icon_file: file icon

icon_refresh: refresh icon

icon_save: save icon

icon_configs: "Configs" popup icon

icon_keys: keyboard icon

icon_info: "About" popup icon

icon_close: close icon (cross)

icon_load: load icon

icon_import: import icon

icon_export: export icon

icon_delete: delete icon

icon_autoload: "Autoload" icon

icon_allow_insecure: "Allow insecure" icon

icon_cloud_upd: cloud update icon

player_texture: player preview texture

fonts
Field
Read Only
Type: accessor<font_base>

A string to font_base map of all managed fonts. You can query and push fonts with custom IDs. When you add a font to this map, it will be automatically destroyed and recreated when required (such as when DX11 device gets lost).

Built-in fonts:

gui_debug: Verdana, 13px

gui_title: Figtree ExtraBold, 23px

gui_main: Figtree Medium, 14px

gui_main_shadow: Figree Medium, 14px, with shadow

gui_main_fb: Segoe UI Semibold, 14px

gui_bold: Figtree ExtraBold, 14px

gui_bold_fb: Segoe UI Black, 14px

gui_semi_bold: Figtree SemiBold, 14px

gui_semi_bold_fb: Segoe UI Bold, 14px

shaders
Field
Read Only
Type: accessor<shader>

A string to shader map of all managed shader. You can query and push shader with custom IDs. When you add a shader to this map, it will be automatically destroyed and recreated when required (such as when DX11 device gets lost).

Build-in shaders:

blur_f: gaussian blur shader

surface
Field
Read Only
Type: layer

The layer you can render on.

Common Types
Last modified: 25 December 2024
In this section, the most common renderer types are listed, that are not particularly bound to a specific part of the renderer.

rect
Last modified: 25 December 2024
This type is a rectangle used within rendering system.

__call
Constructor
Creates a new rectangle.

Arguments

1. Default rectangle (0, 0 position; 0, 0 size).

None.

2. Single value.

Name

Type

Description

value

float

Mins XY, maxs XY value.

3. Single vector.

Name

Type

Description

value

vec2

Mins vector, maxs vector.

4. Double value.

Name

Type

Description

x

float

Mins/maxs X coordinate.

y

float

Mins/maxs Y coordinate.

5. Double vector.

Name

Type

Description

mins

vec2

Mins vector.

maxs

vec2

Maxs vector.

6. Four values.

Name

Type

Description

x0

float

Mins X coordinate.

y0

float

Mins Y coordinate.

x1

float

Maxs X coordinate.

y1

float

Maxs Y coordinate.

Returns

Type

Description

rect

New rectangle.

Example

local my_rect = draw.rect(50, 50, 150, 150);
mins
Field
Type: vec2

Mins (top-left) vector.

maxs
Field
Type: vec2

Maxs (bottom-right) vector.

width
Method
Either returns rectangle's width, or sets a new width.

Arguments

1. Get width.

None.

2. Set width.

Name

Type

Description

value

float

New width.

Returns

1. Get width.

Type

Description

float

Width.

2. Set width.

Type

Description

rect

New rectangle with changed width.

Example

local half_width = rect:width(rect:width() * 0.5);
height
Method
Either returns rectangle's height, or sets a new height.

Arguments

1. Get height.

None.

2. Set height.

Name

Type

Description

value

float

New height.

Returns

1. Get height.

Type

Description

float

Height.

2. Set height.

Type

Description

rect

New rectangle with changed height.

Example

local half_height = rect:height(rect:height() * 0.5);
size
Method
Either returns rectangle's size, or sets a new size.

Arguments

1. Get size.

None.

2. Set size.

Name

Type

Description

value

vec2

New size.

Returns

1. Get size.

Type

Description

vec2

Size.

2. Set size.

Type

Description

rect

New rectangle with changed size.

Example

local half_size = rect:size(rect:size() * draw.vec2(0.5, 0.5));
explode
Method
Explodes the rectangle by given vector (increase size from center into all directions by coordinates in the vector).

Arguments

Name

Type

Description

value

vec2

Explode size.

Returns

Type

Description

rect

Exploded rectangle.

Example

local exp = rect:explode(draw.vec2(6, 6)); -- will subtract -3,-3 from mins and add 3,3 to maxs
half_width
Method
Returns a rectangle with half of the width of this rectangle.

Arguments

None.

Returns

Type

Description

rect

Rectangle with halved width.

Example

local half = rect:half_width();
translate
Method
Translates (moves) this rectangle by vector coordinates.

Arguments

Name

Type

Description

value

vec2

Translation amount.

Returns

Type

Description

rect

Translated rectangle.

Example

local rect = draw.rect(50, 50, 150, 150);
local translated = rect:translate(draw.vec2(5, 5)); -- mins/maxs will be 55,55 and 155,155
margin_left
Method
Move rectangle from the left by given amount.

Arguments

Name

Type

Description

value

float

Margin amount.

Returns

Type

Description

rect

Moved rectangle.

Example

local new = rect:margin_left(5); -- moves to the right by 5px
margin_right
Method
Move rectangle from the right by given amount.

Arguments

Name

Type

Description

value

float

Margin amount.

Returns

Type

Description

rect

Moved rectangle.

Example

local new = rect:margin_right(5); -- moves to the left by 5px
margin_top
Method
Move rectangle from the top by given amount.

Arguments

Name

Type

Description

value

float

Margin amount.

Returns

Type

Description

rect

Moved rectangle.

Example

local new = rect:margin_top(5); -- moves to the bottom by 5px
margin_bottom
Method
Move rectangle from the bottom by given amount.

Arguments

Name

Type

Description

value

float

Margin amount.

Returns

Type

Description

rect

Moved rectangle.

Example

local new = rect:margin_bottom(5); -- moves to the top by 5px
padding_left
Method
Adds the value to the left side of the rectangle.

Arguments

Name

Type

Description

value

float

Padding amount.

Returns

Type

Description

rect

Resized rectangle.

Example

local new = rect:padding_left(5); -- adds 5 to mins x
padding_right
Method
Adds the value to the right side of the rectangle.

Arguments

Name

Type

Description

value

float

Padding amount.

Returns

Type

Description

rect

Resized rectangle.

Example

local new = rect:padding_right(5); -- adds 5 to maxs x
padding_top
Method
Adds the value to the top side of the rectangle.

Arguments

Name

Type

Description

value

float

Padding amount.

Returns

Type

Description

rect

Resized rectangle.

Example

local new = rect:padding_top(5); -- adds 5 to mins y
padding_bottom
Method
Adds the value to the bottom side of the rectangle.

Arguments

Name

Type

Description

value

float

Padding amount.

Returns

Type

Description

rect

Resized rectangle.

Example

local new = rect:padding_bottom(5); -- adds 5 to maxs y
shrink
Method
Shrinks (implodes) the rectangle by given amount.

Arguments

Name

Type

Description

value

float

Shrink value.

Returns

Type

Description

rect

Resized rectangle.

Example

local shrinked = rect:shrink(5); -- adds 5,5 to mins and subtracts 5,5 from maxs
expand
Method
Expands (explodes) the rectangle by given amount.

Arguments

Name

Type

Description

value

float

Expand value.

Returns

Type

Description

rect

Resized rectangle.

Example

local expanded = rect:expand(5); -- subtracts 5,5 from mins and adds 5,5 to maxs
contains
Method
Returns true if this rectangle contains either vector or another rectangle.

Rectangle overload will return true ONLY of entire other rectangle is within the bounds of this one.

Arguments

1. Vector variant.

Name

Type

Description

other

vec2

Vector to check against.

2. Rectangle variant.

Name

Type

Description

other

rect

Rectangle to check against.

Returns

Type

Description

bool

true if other object is in bounds of this rectangle.

Example

if rect:contains(cursor_pos) then
    -- ...
end
overlaps
Method
Returns true if the other rectangle overlaps with this rectangle.

Arguments

Name

Type

Description

other

rect

Rectangle to check against.

Returns

Type

Description

bool

true if other rectangle overlaps with this rectangle.

Example

if rect:overlaps(another_rect) then
    -- ...
end
intersect
Method
Intersects this rectangle with another rectangle.

Arguments

Name

Type

Description

other

rect

Rectangle to intersect with.

Returns

Type

Description

rect

Intersected rectangle.

Example

local intersected = rect:intersect(another_rect);
tl
Method
Returns top-left vector.

Arguments

None.

Returns

Type

Description

vec2

Top-left vector.

Example

local tl = rect:tl();
tr
Method
Returns top-right vector.

Arguments

None.

Returns

Type

Description

vec2

Top-right vector.

Example

local tr = rect:tr();
br
Method
Returns bottom-right vector.

Arguments

None.

Returns

Type

Description

vec2

Bottom-right vector.

Example

local br = rect:br();
bl
Method
Returns bottom-left vector.

Arguments

None.

Returns

Type

Description

vec2

Bottom-left vector.

Example

local bl = rect:bl();
center
Method
Returns center point of this rectangle.

Arguments

None.

Returns

Type

Description

vec2

Center point.

Example

local center = rect:center();
circle
Method
Treats this rectangle as an ellipsis and returns point on it. Note, that this "ellipsis" will be perfect with no modified curvature (basically if this rectangle is a box - you will get a point on a perfect circle).

Arguments

Name

Type

Description

r

float

Radians value.

Returns

Type

Description

vec2

Point on the ellipsis.

Example

local point = rect:circle(rad(250)); -- returns point on the 250th degree
floor
Method
Returns floored rectangle.

Arguments

None.

Returns

Type

Description

rect

Floored rectangle.

Example

local floored = rect:floor();
ceil
Method
Returns ceiled rectangle.

Arguments

None.

Returns

Type

Description

rect

Ceiled rectangle.

Example

local ceiled = rect:ceil();
round
Method
Returns rounded rectangle.

Arguments

None.

Returns

Type

Description

rect

Rounded rectangle.

Example

local rounded = rect:round();
is_zero
Method
Returns true if both mins and maxs are equal to 0.

Arguments

None.

Returns

Type

Description

bool

true if this is a zero rectangle.

Example

if rect:is_zero() then
    -- ...
end

vec2
Last modified: 25 December 2024
This type is a 2D vector used within the rendering system.

__call
Constructor
Creates a new 2D vector instance.

Arguments

1. Default vector (0, 0).

None.

2. Single value.

Name

Type

Description

value

float

X and Y coordinates.

3. XY values.

Name

Type

Description

x

float

X coordinate.

y

float

Y coordinate.

Returns

Type

Description

vec2

New vector.

Example

local vec = draw.vec2(5, 10);
x
Field
Type: float

X coordinate.

y
Field
Type: float

Y coordinate.

floor
Method
Returns floored variant of this vector.

Arguments

None.

Returns

Type

Description

vec2

Floored variant.

Example

local fl = vec:floor();
ceil
Method
Returns ceiled variant of this vector.

Arguments

None.

Returns

Type

Description

vec2

Ceiled variant.

Example

local ceiled = vec:ceil();
round
Method
Returns rounded variant of this vector.

Arguments

None.

Returns

Type

Description

vec2

Rounded variant.

Example

local rounded = vec:round();
len
Method
Returns length of this vector.

Arguments

None.

Returns

Type

Description

float

Length.

Example

local len = vec:len();
len_sqr
Method
Returns squared length of this vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

None.

Returns

Type

Description

float

Length.

Example

local len = vec:len_sqr();
dist
Method
Returns distance to another vector.

Arguments

Name

Type

Description

other

vec2

Other vector.

Returns

Type

Description

float

Distance.

Example

local dist = vec1:dist(vec2);
dist_sqr
Method
Returns squared distance to another vector.

This method is de-facto faster than the non-squared variant. Use it, if you need extra performance.

Arguments

Name

Type

Description

other

vec2

Other vector.

Returns

Type

Description

float

Distance.

Example

local dist = vec1:dist_sqr(vec2);

color
Last modified: 25 December 2024
This type is a color used within the rendering system.

Do not mistake this type with color that is used in game! While these types are interchangeable internally, they are NOT in the API.

__call
Constructor
Creates a new color instance.

Arguments

1. Default color (translucent black).

None.

2. Integer colors.

Name

Type

Description

r

int

Red color (0 to 255).

g

int

Green color (0 to 255).

b

int

Blue color (0 to 255).

a

int

Opacity (0 to 255). Defaults to 255.

3. Hex string.

Name

Type

Description

hex

string

Hex string. Formats are: #rrggbbaa, #rrggbb, #rgba and #rgb.

Returns

Type

Description

color

Color object.

Example

local white = draw.color(255, 255, 255);
white
Function
Returns a white, opaque color.

Arguments

None.

Returns

Type

Description

color

Color object.

Example

local white = draw.color.white();
white_transparent
Function
Returns a white, transparent color.

Arguments

None.

Returns

Type

Description

color

Color object.

Example

local white_t = draw.color.white_transparent();
black
Function
Returns a black, opaque color.

Arguments

None.

Returns

Type

Description

color

Color object.

Example

local black = draw.color.black();
black_transparent
Function
Returns a black, transparent color.

Arguments

None.

Returns

Type

Description

color

Color object.

Example

local black_t = draw.color.black_transparent();
percent
Function
Returns a red-to-green color, depending on the provided percent.

Arguments

Name

Type

Description

p

float

Percentile (0 to 1).

a

float

Opacity. Defaults to 1.

Returns

Type

Description

color

Color object.

Example

local yellow = draw.color.percent(0.5);
gray
Function
Returns a black-to-white color, depending on the provided percent.

Arguments

Name

Type

Description

b

float

Percentile (0 to 1).

a

float

Opacity. Defaults to 1.

Returns

Type

Description

color

Color object.

Example

local gray = draw.color.gray(0.5);
interpolate
Function
Interpolates two colors.

Arguments

Name

Type

Description

a

color

Starting color.

b

color

Ending color.

t

float

Interpolation percentile.

Returns

Type

Description

color

Color object.

Example

local a = draw.color.white();
local b = draw.color.black();
local i = draw.color.interpolate(a, b, 0.5); -- gray
rgba
Method
Returns integer representation of this color (RGBA format)

Arguments

None.

Returns

Type

Description

int

RGBA color.

Example

local num = col:rgba();
argb
Method
Returns integer representation of this color (ARGB format)

Arguments

None.

Returns

Type

Description

int

ARGB color.

Example

local num = col:argb();
bgra
Method
Returns integer representation of this color (BGRA format)

Arguments

None.

Returns

Type

Description

int

BGRA color.

Example

local num = col:bgra();
abgr
Method
Returns integer representation of this color (ABGR format)

Arguments

None.

Returns

Type

Description

int

ABGR color.

Example

local num = col:abgr();
darken
Method
Returns darker variant of this color.

Arguments

Name

Type

Description

value

float

Modulation amount (0 to 1).

Returns

Type

Description

color

Darker color.

Example

local darker = col:darken(0.5);
mod_a
Method
Modulate opacity of the color. This will take existing opacity, and multiply it by whatever value you provide. It is useful if you want to modulate same color in steps, instead of setting the accurate opacity number.

Arguments

1. Float variant.

Name

Type

Description

value

float

Opacity modulation (0 to 1).

2. Integer variant.

Name

Type

Description

value

int

Opacity modulation (0 to 255).

Returns

Type

Description

color

Modulated color.

Example

local half_opacity = col:mod_a(0.5);
r
Method
Override red and return new color.

Arguments

Name

Type

Description

value

float

New value.

Returns

Type

Description

color

New color.

Example

local full_red = col:r(1);
g
Method
Override green and return new color.

Arguments

Name

Type

Description

value

float

New value.

Returns

Type

Description

color

New color.

Example

local full_green = col:g(1);
b
Method
Override blue and return new color.

Arguments

Name

Type

Description

value

float

New value.

Returns

Type

Description

color

New color.

Example

local full_blue = col:b(1);
a
Method
Override opacity and return new color.

Arguments

Name

Type

Description

value

float

New value.

Returns

Type

Description

color

New color.

Example

local full_opacity = col:a(1);
get_r
Method
Returns red color value.

Arguments

None.

Returns

Type

Description

int

Color value.

Example

local r = col:get_r();
get_g
Method
Returns green color value.

Arguments

None.

Returns

Type

Description

int

Color value.

Example

local g = col:get_g();
get_b
Method
Returns blue color value.

Arguments

None.

Returns

Type

Description

int

Color value.

Example

local b = col:get_b();
get_a
Method
Returns opacity color value.

Arguments

None.

Returns

Type

Description

int

Color value.

Example

local a = col:get_a();
h
Method
Return hue value of the color.

Arguments

None.

Returns

Type

Description

int

Hue (0 to 359).

Example

local hue = col:h();
s
Method
Returns saturation value of the color.

Arguments

None.

Returns

Type

Description

float

Saturation (0 to 1).

Example

local saturation = col:s();
v
Method
Returns brightness value of the color.

Arguments

None.

Returns

Type

Description

float

Brightness (0 to 1).

Example

local brightness = col:v();
hsv
Method
Construct new color from provided HSB values.

Arguments

Name

Type

Description

hue

int

Hue (0 to 359).

saturation

float

Saturation (0 to 1).

brightness

float

Brightness (0 to 1).

alpha

float

Override opacity of the source color. Must be either left out, or provided 0 to 1 value.

Returns

Type

Description

color

New color.

Example

local new_col = col:hsv(250, 0.5, 0.1);

accessor
Last modified: 25 December 2024
This type represents a safe way to access maps.

Note that <type> indicates the specific type this instance holds. accessor<texture> for example means that get will return an instance of texture, and set will only accept the type texture as it's obj parameter.

__index
Function
Returns an object by key.

Arguments

Name

Type

Description

key

string

Object key.

Returns

Type

Description

<type>

Object.

Example

local main_font = draw.fonts['gui_main'];

-- this also works
local main_font_2 = draw.fonts.gui_main;
__newindex
Function
Sets an object by key.

Arguments

Name

Type

Description

key

string

Object key.

obj

<type>

Object.

Returns

Nothing.

Example

draw.fonts['my_font'] = my_font;

-- this also works
draw.fonts.my_font = my_font;

adapter
Last modified: 25 December 2024
This type represents a rendering adapter used within the rendering system.

get_back_buffer
Method
Returns a back buffer texture. May return a blank or outdated texture, if the back buffer texture was not updated.

Arguments

None.

Returns

Type

Description

ptr

Back buffer texture pointer.

Example

local bb = adapter:get_back_buffer();
get_back_buffer_downsampled
Method
Returns a 4x down sampled version of the back buffer texture.

Arguments

None.

Returns

Type

Description

ptr

Downsampled back buffer texture pointer.

Example

local ds = adapter:get_back_buffer_downsampled();
get_shared_texture
Method
Returns a shared texture. This texture usually replicates the down sampled back buffer texture, although it is updated automatically ONCE before the rendering on the layer starts.

Arguments

None.

Returns

Type

Description

ptr

Shared texture pointer.

Example

local shared = adapter:get_shared_texture();

layer
Last modified: 25 December 2024
A layer is a type that is used to store render commands, as well as vertex and index data. This is the only way to push shapes and control rendering state.

g
Field
Read Only
Type: command

The next render command to be pushed to the queue. This is the object you want to change to, for example, set a texture, or change rendering modes.

font
Field
Type: font_base

Font to use with add_text. If nothing has been set, no text will get rendered.

tex_sz
Field
Type: vec2?

Texture dimensions. This value is only required if you are trying to render rounded shapes with a texture, so the rendering system will correctly map your UV coordinates to whatever shape you are rendering.

skip_dpi
Field
Type: bool

If set to true, will skip global DPI scale. Defaults to true.

add_triangle_filled
Method
Adds a filled triangle with a single color.

Arguments

Name

Type

Description

a

vec2

A point.

b

vec2

B point.

c

vec2

C point.

col

color

Shape color.

Returns

Nothing.

Example

layer:add_triangle_filled(
    draw.vec2(50, 50), draw.vec2(25, 75),
    draw.vec2(75, 75), draw.color(255, 255, 255));
add_quad_filled
Method
Adds a filled quad with a single color.

Arguments

Name

Type

Description

tl

vec2

Top left point.

tr

vec2

Top right point.

br

vec2

Bottom right point.

bl

vec2

Bottom left point.

col

color

Shape color.

Returns

Nothing.

Example

layer:add_quad_filled(
    draw.vec2(50, 50), draw.vec2(100, 60),
    draw.vec2(100, 100), draw.vec2(30, 70),
    draw.color(255, 255, 255));
add_rect_filled
Method
Adds a filled rectangle with a single color.

Arguments

Name

Type

Description

r

rect

Rectangle.

col

color

Shape color.

Returns

Nothing.

Example

layer:add_rect_filled(draw.rect(50, 50, 150, 150), draw.color(255, 255, 255));
add_circle_filled
Method
Adds a filled circle with a single color.

Arguments

Name

Type

Description

center

vec2

Center point.

radius

float

Circle radius.

c

color

Shape color.

segments

int

Circle segments. If set to 0, will attempt automatic segment deduction. Defaults to 0.

fill

float

Fill amount (clockwise, 0 to 1). Defaults to 1.

Returns

Nothing.

Example

layer:add_circle_filled(draw.vec2(50, 50), 10, draw.color(255, 255, 255));
add_triangle_filled_multicolor
Method
Adds a filled, multicolor triangle.

Arguments

Name

Type

Description

a

vec2

A point.

b

vec2

B point.

c

vec2

C point.

cols

table[color, color, color]

Colors for each point. Colors go in the very same order as the parameter list.

Returns

Nothing.

Example

layer:add_triangle_filled_multicolor(
     draw.vec2(50, 50), draw.vec2(25, 75),
     draw.vec2(75, 75), {
        draw.color(255, 0, 0),
        draw.color(0, 255, 0),
        draw.color(0, 0, 255)
     });
add_rect_filled_multicolor
Method
Adds a filled, multicolor rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

cols

table[color, color, color, color]

Colors for each corner of the rectangle, in clockwise order starting from top-left.

Returns

Nothing.

Example

layer:add_rect_filled_multicolor(
    draw.rect(50, 50, 150, 150), {
        draw.color(255, 0, 0),
        draw.color(0, 255, 0),
        draw.color(0, 0, 255),
        draw.color(255, 255, 0)
    });
add_circle_filled_multicolor
Method
Adds a filled, multicolor circle.

Arguments

Name

Type

Description

center

vec2

Center point.

radius

float

Circle radius.

cols

table[color, color]

Colors for the gradient, starting with the inner and ending with the outer color.

segments

int

The number of segments to approximate the circle. Defaults to 36.

fill

float

The portion of the circle to fill, where 1.0 is a full circle. Defaults to 1.0.

Returns

Nothing.

Example

layer:add_circle_filled_multicolor(
    draw.vec2(100, 100), 50, {
        draw.color(255, 0, 0),
        draw.color(0, 0, 255)
    }, 36, 1.0);
add_quad_filled_multicolor
Method
Adds a filled, multicolor quad.

Arguments

Name

Type

Description

tl

vec2

Top left point.

tr

vec2

Top right point.

br

vec2

Bottom right point.

bl

vec2

Bottom left point.

cols

table[color, color]

Colors for the gradient, applied from bottom to top.

Returns

Nothing.

Example

layer:add_quad_filled_multicolor(
    draw.vec2(50, 50), draw.vec2(150, 50),
    draw.vec2(150, 150), draw.vec2(50, 150), {
        draw.color(255, 0, 0),
        draw.color(0, 0, 255)
    });
add_pill_multicolor
Method
Adds a multicolor pill shape.

Arguments

Name

Type

Description

mins

vec2

Top left point of the pill.

maxs

vec2

Bottom right point of the pill.

radius_min

float

The minimum radius of the pill's rounded edges.

radius_max

float

The maximum radius of the pill's rounded edges.

cols

table[color, color]

Colors for the gradient, applied from bottom to top.

segments

int

The number of segments for approximating rounded edges. Defaults to 16.

Returns

Nothing.

Example

layer:add_pill_multicolor(
    draw.vec2(50, 50), draw.vec2(150, 100),
    10, 20, {
        draw.color(255, 0, 0),
        draw.color(0, 0, 255)
    }, 16);
add_shadow_line
Method
Adds a shadow line.

Arguments

Name

Type

Description

r

rect

Bounding box for the shadow line.

dir

shadow_dir

Shadow direction.

a

float

Max opacity. Defaults to 0.25.

Returns

Nothing.

Example

layer:add_shadow_line(
    draw.rect(50, 50, 150, 150), draw.shadow_dir.down, 0.25);
add_shadow_rect
Method
Adds a shadowed rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

radius

float

Shadow distance, in pixels, outwards.

bg

bool

Whether to draw a background for the rectangle. Defaults to true.

a

float

Max opacity of the shadow. Defaults to 0.25.

Returns

Nothing.

Example

layer:add_shadow_rect(
    draw.rect(50, 50, 150, 150), 15, true, 0.25);
add_glow
Method
Adds a glow box.

Arguments

Name

Type

Description

r

rect

Box rectangle.

radius

float

Glow distance, in pixels, outwards.

c

color

Glow color.

parts

glow_parts

Parts of the glow to enable. Defaults to all.

Returns

Nothing.

Example

layer:add_glow(draw.rect(50, 50, 150, 150), 15, draw.color(255, 0, 0));
add_rect_filled_rounded
Method
Adds a filled, rounded rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

c

color

Fill color.

amount

float

Rounding amount.

rnd

rounding

Rounding mode. Defaults to all.

Returns

Nothing.

Example

layer:add_rect_filled_rounded(
    draw.rect(50, 50, 150, 150),
    draw.color(255, 0, 0),
    10,
    draw.rounding.all
);
add_rect_filled_rounded_multicolor
Method
Adds a filled, multicolor rounded rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

c

table[color, color, color, color]

Fill colors. Used clockwise, starting from top left.

amount

float

Rounding amount.

rnd

rounding

Rounding mode. Defaults to all.

Returns

Nothing.

Example

layer:add_rect_filled_rounded_multicolor(
    draw.rect(50, 50, 150, 150), {
        draw.color(255, 0, 0),
        draw.color(0, 255, 0),
        draw.color(0, 0, 255),
        draw.color(255, 255, 0)
    },
    10,
    draw.rounding.all
);
add_triangle
Method
Adds a stroked triangle.

Arguments

Name

Type

Description

a

vec2

Point A.

b

vec2

Point B.

c

vec2

Point C.

col

color

Line color.

thickness

float

Line thickness. Defaults to 1.0.

mode

outline_mode

Outline mode. Defaults to inset.

Returns

Nothing.

Example

layer:add_triangle(
    draw.vec2(50, 50),
    draw.vec2(25, 75),
    draw.vec2(75, 75),
    draw.color(255, 0, 0),
    1.0,
    draw.outline_mode.inset
);
add_quad
Method
Adds a stroked quad.

Arguments

Name

Type

Description

tl

vec2

Top-left point.

tr

vec2

Top-right point.

br

vec2

Bottom-right point.

bl

vec2

Bottom-left point.

c

color

Line color.

thickness

float

Line thickness. Defaults to 1.0.

mode

outline_mode

Outline mode. Defaults to inset.

Returns

Nothing.

Example

layer:add_quad(
    draw.vec2(50, 50),
    draw.vec2(150, 50),
    draw.vec2(150, 150),
    draw.vec2(50, 150),
    draw.color(255, 0, 0),
    1.0,
    draw.outline_mode.inset
);
add_rect
Method
Adds a stroked rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

c

color

Line color.

thickness

float

Line thickness. Defaults to 1.0.

mode

outline_mode

Outline mode. Defaults to inset.

Returns

Nothing.

Example

layer:add_rect(
    draw.rect(50, 50, 150, 150),
    draw.color(255, 0, 0),
    1.0,
    draw.outline_mode.inset
);
add_circle
Method
Adds a stroked circle.

Arguments

Name

Type

Description

center

vec2

Center point.

radius

float

Circle radius.

c

color

Line color.

segments

int

Circle segments. Defaults to 36.

fill

float

Fill amount. Defaults to 1.0.

thickness

float

Line thickness. Defaults to 1.0.

mode

outline_mode

Outline mode. Defaults to inset.

Returns

Nothing.

Example

layer:add_circle(
    draw.vec2(100, 100),
    50,
    draw.color(255, 0, 0),
    36,
    1.0,
    1.0,
    draw.outline_mode.inset
);
add_line
Method
Adds a line.

Arguments

Name

Type

Description

a

vec2

Start point.

b

vec2

End point.

c

color

Line color.

thickness

float

Line thickness. Defaults to 1.0

Returns

Nothing.

Example

layer:add_line(
    draw.vec2(50, 50),
    draw.vec2(150, 150),
    draw.color(255, 0, 0)
);
add_line_multicolor
Method
Adds a multicolor line.

Arguments

Name

Type

Description

a

vec2

Start point.

b

vec2

End point.

c

color

Start color.

c2

color

End color.

thickness

float

Line thickness. Defaults to 1.0.

Returns

Nothing.

Example

layer:add_line_multicolor(
    draw.vec2(50, 50),
    draw.vec2(150, 150),
    draw.color(255, 0, 0),
    draw.color(0, 0, 255),
    2.0
);
add_rect_rounded
Method
Adds a rounded, filled rectangle.

Arguments

Name

Type

Description

r

rect

Rectangle.

c

color

Line color.

amount

float

Rounding amount.

rnd

rounding

Rounding mode. Defaults to all.

thickness

float

Line thickness. Defaults to 1.0.

mode

outline_mode

Outline mode. Defaults to inset.

Returns

Nothing.

Example

layer:add_rect_rounded(draw.rect(50, 50, 150, 150),
    draw.color(255, 255, 255), 14);
add_text
Method
Adds text.

If font wasn't set, this function will do nothing.

Arguments

Name

Type

Description

p

vec2

Text origin point.

text

string

Text.

c

color

Text color.

params

text_params?

Text aligning parameters. Defaults to nil.

Returns

Nothing.

Example

layer:add_text(draw.vec2(50, 50), 'Hello world!', draw.color(255, 255, 255));
override_clip_rect
Method
Overrides clip rectangle with support of intersection.

Arguments

Name

Type

Description

r

rect?

New clip rect.

intersect

bool

Whether this function should intersect previous rect with the new one. Defaults to true.

Returns

Nothing.

Example

layer:override_clip_rect(draw.rect(50, 50, 150, 150));

outline_mode
Last modified: 25 December 2024
This enum is used to determine the outline mode for outlined shapes.

inset
Field
Inset outlining. This means that the outline will be inside the shape (+1px from top-left, -1px from bottom-right).

outset
Field
Outset outlining. This means that the outline will be outside of the shape (-1px from top-left, +1px from bottom-right).

center
Field
Center outlining. This means that the outline will match the shape size.

rounding
Last modified: 25 December 2024
This enum is used to determine the rounding for rounded shapes.

tl
Field
Round top-left corner.

tr
Field
Round top-right corner.

bl
Field
Round bottom-left corner.

br
Field
Round bottom-right corner.

t
Field
Round both of the top corners. This produces the same result as using bit.bor(draw.rounding.tl, draw.rounding.tr).

l
Field
Round both of the left corners. This produces the same result as using bit.bor(draw.rounding.tl, draw.rounding.bl).

r
Field
Round both of the right corners. This produces the same result as using bit.bor(draw.rounding.tr, draw.rounding.br).

b
Field
Round both of the bottom corners. This produces the same result as using bit.bor(draw.rounding.bl, draw.rounding.br).

all
Field
Round all corners. This produces the same result as using bit.bor(draw.rounding.tl, draw.rounding.tr, draw.rounding.bl, draw.rounding.br).

glow_parts
Last modified: 25 December 2024
This enum is used to determine which parts of the glow around the shape should get rendered.

tl
Field
Draw top-left corner.

tr
Field
Draw top-right corner.

bl
Field
Draw bottom-left corner.

br
Field
Draw bottom-right corner.

t
Field
Draw top line.

l
Field
Draw left line.

r
Field
Draw right line.

b
Field
Draw bottom line.

all_left
Field
Draw all the left side shapes. This includes both left corners and the line.

all_right
Field
Draw all the right side shapes. This includes both right corners and the line.

all_top
Field
Draw all the top side shapes. This includes both top corners and the line.

all_bottom
Field
Draw all the bottom side shapes. This includes both bottom corners and the line.

all
Field
Draw the entire glow around the shape.

no_bottom
Field
Draw glow except for the bottom line.

no_top
Field
Draw glow except for the top line.

no_right
Field
Draw glow except for the right line.

no_left
Field
Draw glow except for the left line.

text_params
Last modified: 25 December 2024
This type is used to determine text alignment.

Line alignment only makes sense if you have multiple lines in your text. By default, all next lines will start from the left side of the text. You can change this behavior by using one of the functions that take line as a parameter. For example, if you pass right to the line alignment, all next lines will start from the right side. Text alignment will remain as dictated by v and h parameters.

with_v
Function
Creates text_params instance with vertical alignment.

Arguments

Name

Type

Description

v

text_alignment

Vertical alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align_top = draw.text_params.with_v(draw.text_alignment.top);
with_h
Function
Creates text_params instance with horizontal alignment.

Arguments

Name

Type

Description

h

text_alignment

Horizontal alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align_right = draw.text_params.with_h(draw.text_alignment.right);
with_line
Function
Creates text_params instance with line alignment.

Arguments

Name

Type

Description

line

text_alignment

Line alignment.

Returns

Type

Description

text_params

Created text params.

Example

local lines_center = draw.text_params.with_line(draw.text_alignment.center);
with_vh
Function
Creates text_params instance with vertical and horizontal alignments.

Arguments

Name

Type

Description

v

text_alignment

Vertical alignment.

h

text_alignment

Horizontal alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align_bottom_right = draw.text_params.with_vh(draw.text_alignment.bottom, draw.text_alignment.right);
with_vline
Function
Creates text_params instance with vertical alignment and line alignment.

Arguments

Name

Type

Description

v

text_alignment

Vertical alignment.

line

text_alignment

Line alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align = draw.text_params.with_vline(draw.text_alignment.bottom, draw.text_alignment.center);
with_hline
Function
Creates text_params instance with horizontal alignment and line alignment.

Arguments

Name

Type

Description

h

text_alignment

Horizontal alignment.

line

text_alignment

Line alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align = draw.text_params.with_hline(draw.text_alignment.center, draw.text_alignment.center);
with_vhline
Function
Creates text_params instance with vertical, horizontal and line alignments.

Arguments

Name

Type

Description

v

text_alignment

Vertical alignment.

h

text_alignment

Horizontal alignment.

line

text_alignment

Line alignment.

Returns

Type

Description

text_params

Created text params.

Example

local align = draw.text_params.with_vhline(draw.text_alignment.center, draw.text_alignment.center, 

text_alignment
Last modified: 25 December 2024
This enum determines how to align the text when drawing it.

left and top, as well as right and bottom are interchangeable. It means that if you use left for vertical alignment, it will produce exactly the same result as using top, and vice versa. top/bottom are here only for the sake of convenience and readability.

left
Field
Align left. It will mean that the text position's X coordinate is located at the left side of the text area.

center
Field
Align center. It will mean that the text position's X (or Y) coordinate is located at the center of the text area.

right
Field
Align right. It will mean that the text position's X coordinate is located at the right side of the text area.

top
Field
Align top. It will mean that the text position's Y coordinate is located at the top side of the text area.

bottom
Field
Align bottom. It will mean that the text position's Y coordinate is located at the bottom side of the text area.

shadow_dir
Last modified: 25 December 2024
This enum is used to determine shadow direction for add_shadow_line method.

up
Field
The darkest side of the shadow will be at the bottom.

down
Field
The darkest side of the shadow will be at the top.

left
Field
The darkest side of the shadow will be on the left side.

right
Field
The darkest side of the shadow will be on the right side.

command
Last modified: 25 December 2024
This type is used to change render command parameters.

Be cautious when changing stuff in an instance of this type. Passing invalid data to texture or frag_shader, or not restoring some changes after you're done drawing can lead to undefined behavior, and more likely, a crash. If you are not sure how to operate this type, take a look into examples.

texture
Field
Type: ptr

Texture pointer. You can get one from an instance of texture type by accessing obj field. Passing invalid data to this field WILL result in a crash. For a safer way, please use set_texture.

frag_shader
Field
Type: Type: ptr

Fragment shader (aka Pixel Shader in DirectX terms) pointer. You can get one from an instance of shader type by accessing obj field. Passing invalid data to this field WILL result in a crash. For a safer way, please use set_shader.

clip_rect
Field
Type: rect?

Clip rectangle used for scissor testing. If this is set to nil, will not clip anything.

It is advised to instead use layer's override_clip_rect method. While you can pass custom rect to this field, you will lose information about previous clip rects set before. Using that method will make sure to intersect the previous rect with the one you pass and produce a probably more expected result.

uv_rect
Field
Type: rect?

UV rect used for texture mapping. If this field is set to nil, will use 0, 0, 1, 1 rectangle to map the texture. You can learn more about texture mapping in the tutorial section.

alpha
Field
Type: float

Global opacity override. Defaults to 1, but if you set anything else - will modulate opacity of every next shape you will render.

rotation
Field
Type: float

Shape rotation. Not all shapes support this field. The value is set in degrees, not radians.

anti_alias
Field
Type: bool

If set to true, will apply tesselation to shapes.

As of now, not every shape supports tesselation, but it is advised to have it enabled at all times anyway. It will produce much better result anyway.

ignore_scaling
Field
Type: bool

If set to true, will ignore global DPI scale. This is set to true by default, but you are free to change it to false if you are trying to render some custom UI elements.

chained_call
Field
Type: bool

Only useful when using shaders. If set to true, will not update back buffer texture. This can be used if you need the very same texture data, as when applying several shaders to the back buffer.

Please note that capturing back buffer is a rather slow operation. It is better to not capture it too often. Back buffer is automatically captured to the only layer you can use anyway, and it is better to use that one instead, to make sure rendering happens as fast as it is possible.

only_downsampled
Field
Type: bool

If set to true, will capture back buffer (as long as chained_call is set to false). The name of this field is quite misleading due to the fact that in the CS:GO version of Fatality, it was used to configure if the rendering system should also downsample the captured backbuffer into another texture. In DirectX11, this operation is much faster, so it is done regardless.

capture_back_buffer
Field
Type: bool

An alias to only_downsampled.

is_tile
Field
Type: bool

If set to true, will use a separate texture sampler that supports tiling. By default, all textures are stretched, but if you enable this option - their tiling and stretch will be fully configurable by the uv_rect field.

mode
Field
Type: render_mode

Rendering mode. You can read more about it in the type's documentation.

set_texture
Method
Sets a texture in a safe manner.

Arguments

Name

Type

Description

tex

texture

Texture object.

Returns

Nothing.

Example

cmd:set_texture(my_tex);
set_shader
Method
Sets a fragment shader in a safe manner.

Arguments

Name

Type

Description

sh

[shader]

Shader object.

Returns

Nothing.

Example

cmd:set_shader(my_shader);

render_mode
Last modified: 25 December 2024
This enum is used to toggle rendering modes.

normal
Field
Normal, opaque rendering. All polygons will get filled with color, and texture sampling will be fully supported. This is the default mode to render shapes in layer.

wireframe
Field
Wireframe rendering. This means that the polygons will no longer be filled with color, nor texture sampling will ever work.

managed
Last modified: 25 December 2024
This type represents a managed object. You cannot create an instance of this type directly.

Every object, that inherits from this type, must be created before use. The rendering system will only create them automatically, if you happen to lose a device object (e.g. minimize the game window, and then restore it) and only if you add your objects to manage table in draw.

obj
Field
Read Only
Type: ptr

Pointer to a GPU object. If this object is not created, this field will be nil. You can use the value of this field to pass it to command directly for example, or if you (for whatever reason we don't recommend you doing) want to have a direct control over the pointer - cast it to FFI's cdata.

create
Method
Creates a managed object in GPU memory.

You should create() an object only once. Invoking this method after the object was created will be meaningless.

Arguments

None.

Returns

Nothing.

Example

tex:create();
destroy
Method
Destroys a managed object in GPU memory.

Never destroy a GPU object if it is being used in rendering (for example, when you have pushed some shape that uses a texture, and then destroyed that texture). This will lead to undefined behavior, and most likely, **crash the game **.

Arguments

None.

Returns

Nothing.

Example

font:destroy();

texture
Last modified: 25 December 2024
This type represents a texture object.

This type inherits managed type. All of its base methods and fields are also available in this type.

Supported texture formats are:

JPEG (.jpg, .jpeg) - 12 bpc/arithmetic are not supported.

PNG (.png)

TGA (.tga)

BMP (.bmp) - 1 bpp and RLE variants are not supported.

PSD (.psd) - composited view only, no extra channels, 8/16 bpc

GIF (.gif) - only first frame, for animated gifs use animated_texture

HDR (.hdr)

PIC (.pic)

PNM (.pnm, .ppm, .pgm) - PPM and PGM are binary only

__call
Constructor
Constructs an instance of this type.

Passing an invalid pointer, a or memory region that is smaller than the size will result in a crash.

Arguments

1. From file.

Name

Type

Description

path

string

Path to a valid texture file.

2. From memory.

Name

Type

Description

data

ptr

Pointer to texture file data in memory.

sz

int

Size of the texture file data.

3. From RGBA data.

Name

Type

Description

data

ptr

Pointer to RGBA data in memory.

w

int

Width.

h

int

Height (row count).

p

int

Pitch (row width). This is the amount of bytes per row.

Returns

Type

Description

texture

Texture object.

Example

local tex = draw.texture('funny_meme.png');
is_animated
Field
Read Only
Type: bool

Set to true if this is an instance of animated_texture.

get_size
Method
Returns size of this texture.

Arguments

None.

Returns

Type

Description

vec2

Texture dimensions.

Example

local sz = tex:get_size();

svg_texture
Last modified: 25 December 2024
This type represents an SVG texture object.

This type inherits texture type. All of its base methods and fields are also available in this type.

Passing invalid SVG data to the constructor will cause a crash. We will fix this issue in future updates.

__call
Constructor
Constructs an SVG texture.

Arguments

Name

Type

Description

sv

string

SVG text.

h

float

Target height. Defaults to 0, and 0 means that there will be no automatic downscale.

Returns

Type

Description

svg_texture

SVG texture object.

Example

local lightning = draw.svg_texture([[
<svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M9.55563 13.3232L9.43584 13.3123C7.90803 13.1735 7.14412 13.104 6.90146 12.5814C6.65881 12.0588 7.09869 11.4304 7.97846 10.1736L11.5612 5.05544C12.1424 4.22517 12.433 3.81003 12.6836 3.89831C12.9342 3.98658 12.9005 4.4922 12.8331 5.50343L12.6299 8.55194C12.5685 9.47214 12.5379 9.93224 12.8023 10.2419C13.0667 10.5515 13.5259 10.5933 14.4444 10.6768L14.5642 10.6877C16.092 10.8265 16.8559 10.896 17.0985 11.4186C17.3412 11.9412 16.9013 12.5696 16.0215 13.8264L12.4388 18.9446C11.8576 19.7748 11.567 20.19 11.3164 20.1017C11.0658 20.0134 11.0995 19.5078 11.1669 18.4966L11.3701 15.4481C11.4315 14.5279 11.4621 14.0678 11.1977 13.7581C10.9333 13.4485 10.4741 13.4067 9.55563 13.3232Z" fill="#ffffff"/>
<path d="M18.5 4L17 6H19L17.5 8" stroke="#ffffff" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M6.5 16L5 18H7L5.5 20" stroke="#ffffff" stroke-opacity="0.6" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
]], 24);

animated_texture
Last modified: 25 December 2024
This type is an animated texture. This texture type only supports animated GIF types, and does not support APNG.

This type inherits texture type. All of its base methods and fields are also available in this type.

If you pass an unsupported type, it will instead work exactly like texture type, meaning controlling frames and looping will be meaningless.

Using this type for texture atlases is possible, although highly unrecommended. It will produce extra texture objects in memory, and overall will be much slower. Instead, it is advised to construct an actual texture atlas, use texture type, and use texture mapping.

__call
Constructor
Constructs animated texture.

Passing an invalid pointer, a or memory region that is smaller than the size will result in a crash.

Arguments

1. From file.

Name

Type

Description

path

string

Path to the texture file.

2. From memory.

Name

Type

Description

data

ptr

Pointer to texture file data in memory.

sz

int

Size of the texture file data.

Returns

Type

Description

animated_texture

Animated texture instance.

Example

local gif = draw.animated_texture('funny_gif.gif');
should_loop
Field
Type: bool

If set to false, will not loop the animation automatically. Defaults to true.

reset_loop
Method
Reset loop to run from the first frame.

Arguments

None.

Returns

Nothing.

Example

gif:reset_loop();
set_frame
Method
Set a specific frame on the animation. If looping is enabled, will continue the cycle from the passed frame. Otherwise, will display a specific frame of the animation.

Frame count starts from 0.

Arguments

Name

Type

Description

frame

int

Frame number. Invalid frame numbers will be clamped.

Returns

Nothing.

Example

gif:set_frame(5);
get_frame_count
Method
Returns amount of frames in the animation.

Arguments

None.

Returns

Type

Description

int

Frame count.

Example

local frames = gif:get_frame_count();
gif:set_frame(frames - 2); -- set to the last frame

shader
Last modified: 25 December 2024
This type represents a shader. HLSL documentation

This type inherits managed type. All of its base methods and fields are also available in this type.

Only fragment shaders (aka Pixel Shaders) are supported.

Rendering system uses Shader Version 4 (ps_4_0).

HLSL structures
The constant buffer fields are the following:

Name

Type

Description

mvp

float4x4

Projection matrix.

tex

float2

Texture dimensions.

time

float

Render time (NOT the frame time).

alpha

float

Global opacity override.

The input fields are the following:

Name

Type

Description

pos

float4

Vertex position on screen (x,y,z over w). Register: SV_POSITION.

col

float4

Vertex color tint (r, g, b, a). Register: COLOR0.

uv

float2

UV coordinates (u, v). Register: TEXCOORD0.

The bound objects are the following:

Name

Type

Description

sampler0

sampler

Texture sampler.

texture0

Texture2D

Texture object.

Template:

cbuffer cb : register(b0) {
    float4x4 mvp;
    float2 tex;
    float time;
    float alpha;
};

struct PS_INPUT {
    float4 pos : SV_POSITION;
    float4 col : COLOR0;
    float2 uv : TEXCOORD0;
};

sampler sampler0;
Texture2D texture0;
__call
Constructor
Constructs a shader.

Arguments

Name

Type

Description

src

string

Shader source code.

Returns

Type

Description

shader

Shader object.

Example

local blur = draw.shader([[

// define constant buffer.
cbuffer cb : register(b0) {
    float4x4 mvp;
    float2 tex;
    float time;
    float alpha;
};

// define input.
struct PS_INPUT {
    float4 pos : SV_POSITION;
    float4 col : COLOR0;
    float2 uv : TEXCOORD0;
};

// use texture sampler and texture.
sampler sampler0;
Texture2D texture0;

float4 main(PS_INPUT inp) : SV_Target {
    float radius = 2.0; // blur radius
    float2 inv_size = 1.0 / tex.xy; // inversed size of the texture
    float weight = 0.0; // total weight
    float4 color = 0.0; // total color

    // perform a gaussian blur
    for (float x = -radius; x <= radius; x += 1.0)
    {
        for (float y = -radius; y <= radius; y += 1.0)
        {
            float2 coord = inp.uv + float2(x, y) * inv_size;
            color += texture0.Sample(sampler0, coord) * exp(-((x * x + y * y) / (2.0 * radius * radius)));
            weight += exp(-((x * x + y * y) / (2.0 * radius * radius)));
        }
    }

    // average the color
    color /= weight;
    color.a *= inp.col.a; // apply alpha modulation
    return color;
}
]]);

font_base
Last modified: 25 December 2024
This type represents the base class for font types. You cannot create an instance of this type. Instead, use the children types.

This type inherits managed type. All of its base methods and fields are also available in this type.

Definitions:

codepoint: Unicode representation of the character.

kerning: a distance between two characters.

glyph: visual representation of a character.

height
Field
Read Only
Type: float

Font height, in pixels.

ascent
Field
Type: float

Font ascent value, in pixels.

descent
Field
Type: float

Font descent value, in pixels.

line_gap
Field
Type: float

Font line gap, in pixels.

kerning_gap
Field
Type: float

Font kerning gap, in pixels.

outline_alpha
Field
Type: float

Font outline opacity (0 to 1). Defaults to 0.45.

flags
Field
Read Only
Type: font_flags

Font flags. Use bit library to read flags.

y_offset
Field
Type: int

Glyph Y offset, in pixels. Will alter the location of a glyph in the atlas. Changing this value after the font was created is meaningless.

x_offset
Field
Type: int

Glyph X offset, in pixels. Will alter the location of a glyph in the atlas. Changing this value after the font was created is meaningless.

fallback_font
Field
Type: font_base

Fallback font to use, in case a glyph is not found in this font. Is it useful when one font does not have codepoints for specific symbols, that are present in another font, but you still want to prefer this font's glyphs over other font.

dropshadow_color
Field
Type: color

Shadow color. Only R, G, B values are used.

get_kerned_char_width
Method
Returns character width, included with kerning.

Arguments

Name

Type

Description

left

int

Previous character codepoint.

right

int

Current character codepoint.

Returns

Type

Description

float

Distance, in pixels.

Example

local w = font:get_kerned_char_width(prev_cp, cp);
get_kerning
Method
Returns kerning value for a single character. If kerning is disabled, will instead return kerning gap.

Arguments

Name

Type

Description

cp

int

Codepoint.

Returns

Type

Description

float

Kerning value, in pixels.

Example

local k = font:get_kerning(cp);
get_text_size
Method
Returns text area size.

Arguments

Name

Type

Description

text

string

Text.

skip_scaling

bool

If set to true, will skip global DPI scaling. Defaults to false.

til_newline

bool

Calculate size only until a line break is met. Defaults to false.

Returns

Type

Description

vec2

Text area size.

Example

local sz = font:get_text_size('Hello!');
wrap_text
Method
Wraps text to meet the desired width. Wrapping is done by breaking text by words and inserting line breaks in between. If one of the words is longer than the target width, will instead use that word's width.

Arguments

Name

Type

Description

text

string

Text to wrap.

width

float

Target width.

Returns

Type

Description

string

Wrapped text.

Example

local shorter = font:wrap_text('This is some very long text!', 50);
get_glyph
Method
Returns glyph information for a character.

Arguments

Name

Type

Description

codepoint

int

Codepoint.

Returns

Type

Description

glyph_t

Glyph information.

Example

local glyph = font:get_glyph(cp);
get_texture
Method
Returns a texture atlas that contains the provided glyph.

Arguments

Name

Type

Description

gl

glyph_t

Character glyph.

Returns

Type

Description

int

Texture pointer, or nil if not found.

Example

local atlas = font:get_texture(glyph);

font
Last modified: 25 December 2024
This type represents a font object. Internally, this type uses FreeType library to rasterize font glyphs.

This type inherits font_base type. All of its base methods and fields are also available in this type.

__call
Constructor
Constructs a font object.

Passing an invalid pointer, a or memory region that is smaller than the size will result in a crash.

Arguments

1. From file.

Name

Type

Description

path

string

Path to a ttf/otf file.

size

float

Font height, in pixels.

fl

font_flags

Font flags. Use bit library to construct them. Defaults to 0.

mi

int

Starting codepoint. Defaults to 0.

ma

int

Ending codepoint. Defaults to 255 (entire ASCII code page).

1. From memory.

Name

Type

Description

mem

ptr

Pointer to a font file in memory.

sz

int

Font file size, in bytes.

size

float

Font height, in pixels.

fl

font_flags

Font flags. Use bit library to construct them. Defaults to 0.

mi

int

Starting codepoint. Defaults to 0.

ma

int

Ending codepoint. Defaults to 255 (entire ASCII code page).

1. From memory, with codepoint pairs.

Name

Type

Description

mem

ptr

Pointer to a font file in memory.

sz

int

Font file size, in bytes.

size

float

Font height, in pixels.

fl

font_flags

Font flags. Use bit library to construct them. Defaults to 0.

pairs

table[{int, int}...]

Min/max pairs. This is a standard array, consisting of {int, int} pairs.

Returns

Type

Description

font

Font object.

Example

local cool_font = draw.font('myfont.ttf', 16);

font_gdi
Last modified: 25 December 2024
This type represents a font object. Internally, this type uses GDI library to rasterize font glyphs.

This type inherits font_base type. All of its base methods and fields are also available in this type.

__call
Constructor
Constructs a font object.

Arguments

Name

Type

Description

name

string

System font name (example: 'Arial').

size

float

Font height, in pixels.

fl

font_flags

Font flags. Use bit library to construct them. Defaults to 0.

mi

int

Starting codepoint. Defaults to 0.

ma

int

Ending codepoint. Defaults to 255 (entire ASCII code page).

weight

int

Font weight. Defaults to 400 (regular).

Returns

Type

Description

font_gdi

Font object.

Example

local sys_font = draw.font_gdi('Calibri', 14);

glyph_t
Last modified: 25 December 2024
This type represents a glyph object.

codepoint
Field
Read Only
Type: int

Character codepoint.

size
Field
Read Only
Type: vec2

Glyph dimensions.

offset
Field
Read Only
Type: vec2

Glyph offset.

uv
Field
Read Only
Type: rect

UV rect on the texture atlas.

font_flags
Last modified: 25 December 2024
This enum determines which flags a font object should possess. Setting those flags is only possible during type construction.

shadow
Field
Adds a 1px shadow to font glyphs.

outline
Field
Adds a 1px outline to font glyphs.

anti_alias
Field
Enable antialiasing on font glyphs. This flag only works on GDI fonts.

no_dpi
Field
Disable DPI scaling on this font. By default, font glyphs will be scaled in accordance to the global DPI scale.

no_kern
Field
Disable glyph kerning on this font.

mono
Field
Enables a strong hinting algorithm for rasterization. Only works on FreeType fonts.

light
Field
Enables a light hinting algorithm for rasterization. Only works on FreeType fonts.

gui
Last modified: 25 December 2024
Usage:

gui.{func_or_field}
This table exposes the GUI system of the software.

All types and enums described in the child sections must be prefixed with gui..

ctx
Field
Type: context

GUI context.

notify
Field
Type: notification_system

Notification system.

make_control
Function
Wraps a control into a layout consisting of a label and that specific control. You should add this new control to groupboxes if you want your control to be displayed nicely. Additionally, you can add any extra controls to the returned one - those will get stacked to the left side of your initial control.

Arguments

Name

Type

Description

text

string

Label value.

c

control

Control object.

Returns

Type

Description

layout

Layout object.

Example

local row = gui.make_control('Hello checkbox!', my_cb);

Common Types
Last modified: 25 December 2024
In this section, the most common gui types are listed, that are not particularly bound to a specific part of the gui.

bits
Last modified: 25 December 2024
This type represents a bitset value.

Maximal bit number for this type is 63. Setting or getting any bits outside of that range will cause a crash.

reset
Method
Resets the value.

Arguments

None.

Returns

Nothing.

Example

bits:reset();
get_raw
Method
Returns the raw value.

Arguments

None.

Returns

Type

Description

int

Raw value.

Example

local raw = bits:get_raw();
set_raw
Method
Sets the raw value.

Arguments

Name

Type

Description

val

int

Raw value.

Returns

Nothing.

Example

bits:set_raw(long_long_value);
none
Method
Returns true if no bits are set.

Arguments

None.

Returns

Type

Description

bool

true if no bits are set.

Example

if bits:none() then
    -- ...
end
set
Method
Enables a bit.

Arguments

Name

Type

Description

bit

int

Bit number.

Returns

Nothing.

Example

bits:set(5); -- set bit #5 (same as bit.bor(val, bit.lshift(1, 5)))
unset
Method
Disables a bit.

Arguments

Name

Type

Description

bit

int

Bit number.

Returns

Nothing.

Example

bits:unset(5);
get
Method
Returns bit state.

Arguments

Name

Type

Description

bit

int

Bit number.

Returns

Type

Description

bool

Bit status.

Example

if bits:get(5) then
    -- ...
end
toggle
Method
Toggles bit state.

Arguments

Name

Type

Description

bit

int

Bit number.

Returns

Nothing.

Example

bits:toggle(5);

control_id
Last modified: 25 December 2024
This type represents a control ID.

__call
Constructor
Constructs the ID structure.

Arguments

Name

Type

Description

id

string

ID.

Returns

Type

Description

control_id

ID structure.

Example

local id = gui.control_id('my_id');
id
Field
Read Only
Type: int

Hashed representation of the ID.

id_string
Field
Read Only
Type: string

Normal representation of the ID.

context
Last modified: 25 December 2024
This type represents the GUI context.

find
Method
Finds a control by ID.

Arguments

Name

Type

Description

id

string

Control ID.

Returns

Type

Description

<control>?

Casted control. Returns nil if the control was not found, or casting failed.

Example

local some_cb = ctx:find('some_cb');
user
Field
Type: user_t

User's basic information.

user_t
Last modified: 25 December 2024
This type represents basic user information.

avatar
Field
Read Only
Type: texture?

User's avatar. May be nil.

username
Field
Read Only
Type: string

User's username.

notification_system
Last modified: 25 December 2024
This type represents a notification system.

add
Method
Adds a notification to the list.

Arguments

Name

Type

Description

notif

notification

Notification object.

Returns

Nothing.

Example

notif:add(my_notification);

notification
Last modified: 25 December 2024
This type represents a notification item.

__call
Constructor
Constructs the notification.

Arguments

Name

Type

Description

hdr

string

Header (title).

txt

string

Text (body).

ico

texture?

Icon. Defaults to nil.

Returns

Type

Description

notification

Notification object.

Example

local notif = gui.notification('Hello', 'Lua works!');

control
Last modified: 25 December 2024
This type represents an abstract GUI control.

id
Field
Read Only
Type: int

Control ID.

id_string
Field
Read Only
Type: string

String representation of control's ID. This may be empty for some controls.

is_visible
Field
Read Only
Type: bool

Control's visibility state.

parent
Field
Read Only
Type: control?

Parent control. Might be nil on some controls.

type
Field
Read Only
Type: control_type

Control's type.

inactive
Field
Type: bool

If set to true, will mark this control to the inactive state.

inactive_text
Field
Type: string

Tooltip replacement to show when control is inactive.

inactive_color
Field
Type: color

Label color override for inactive controls.

tooltip
Field
Type: string

Tooltip text.

aliases
Field
Type: table[string]

Alias list for this control. Used in search box to support different naming (e.g. if a user searches for "Double tap", will find "Rapid fire" instead).

get_hotkey_state
Method
Returns true if any of the control's hotkeys are active.

Arguments

None.

Returns

Type

Description

bool

true if any hotkey is active.

Example

if ctrl:get_hotkey_state() then
    -- ...
end
set_visible
Method
Changes visibility state for this control.

Calling this method on controls that are located in layouts with large amount of other controls will inevitably cause performance issues due to auto-stacking.

Arguments

Name

Type

Description

val

bool

Visibility state.

Returns

Nothing.

Example

ctrl:set_visible(false);
add_callback
Method
Adds a callback to this control.

Arguments

Name

Type

Description

cbk

function

Callback.

Returns

Nothing.

Example

ctrl:add_callback(function ()
    print('Callback invoked!');
end);
cast
Method
Attempts to downcast the control to the correct type.

Due to Lua engine's limitations, it is impossible to automatically downcast variables. Usually there is no need to call this method, unless you found some control that wasn't somehow already cast to the desired type. find() methods automatically perform the cast to the correct type.

Arguments

None.

Returns

Type

Description

<control>

New type, if any.

Example

local checkbox = maybe_checkbox:cast();
reset
Method
Resets control's state. This action is usually required if you change control's value directly by interacting with value_param.

Arguments

None.

Returns

Nothing.

Example

ctrl:reset();

control_type
Last modified: 25 December 2024
This enum determines the current control's type.

default
Field
Default control. You are very unlikely to ever stumble upon this type.

button
Field
Button control.

checkbox
Field
Checkbox control.

child_tab
Field
Child tab control. Only possible to find within tab_layout controls.

color_picker
Field
Color picker control.

combo_box
Field
Combo box control.

control_container
Field
Default control with a container. You are very unlikely to ever stumble upon this type.

group
Field
Groupbox control.

hotkey
Field
Hotkey input control.

hsv_slider
Field
HSB slider (Saturation/Brightness box, Hue slider and Opacity slider).

label
Field
Label control.

layout
Field
Layout control.

list
Field
Listbox control.

loading
Field
Loading spinner.

notification_control
Field
Notification item control. One of the types in the core UI framework, never actually used within Fatality.

popup
Field
Basic popup window.

selectable
Field
Basic selectable item.

slider
Field
Slider item. This type doesn't tell the internal value type used.

spacer
Field
Spacer control.

tab
Field
Horizontal or vertical tab.

tabs_layout
Field
A variant of layout that is used specifically to operate tabs.

weapon_tabs_layout
Field
A variant of layout that is used specifically to operate weapon tabs.

text_input
Field
Text input control.

toggle_button
Field
A variant of button that looks like button, but works like a checkbox.

window
Field
Basic window control.

widget
Field
Basic widget control.

settings
Field
Settings control.

value_param
Last modified: 25 December 2024
This type represents a value data used by some control types.

Note, that this part: <type> is used to designate what exact type the instance of this type is holding. For example, when it says value_param<bool>, it means that get will return a bool value, and set will accept only the type bool as it's val parameter.

get
Method
Returns the value.

Arguments

None.

Returns

Type

Description

<type>

Value.

Example

ctrl:get_value():get();
set
Method
Sets the value.

It is advised to use set_value method of the control, if any.

Arguments

Name

Type

Description

val

<type>

Value.

Returns

Nothing.

Example

ctrl:get_value():set(123);
get_hotkey_state
Method
Returns true if there's any active hotkeys.

Arguments

None.

Returns

Type

Description

bool

true if any hotkey is active.

Example

if ctrl:get_value():get_hotkey_state() then
    -- ...
end
disable_hotkeys
Method
Disables all active hotkeys. This allows you to override the value.

Arguments

None.

Returns

Nothing.

Example

ctrl:get_value():disable_hotkeys();

checkbox
Last modified: 25 December 2024
This type represents a checkbox control.

This type inherits control type. All of its base methods and fields are also available in this type.

__call
Constructor
Constructs the checkbox.

Arguments

Name

Type

Description

id

control_id

ID.

Returns

Type

Description

checkbox

Checkbox instance.

Example

local cb = gui.checkbox(gui.control_id('my_id'));
get_value
Method
Returns checkbox' value.

Arguments

None.

Returns

Type

Description

value_param<bool>

Value data.

Example

local val = cb:get_value():get();
set_value
Method
Sets checkbox' value.

It is advised to use this method instead of value_param's set method.

Arguments

Name

Type

Description

val

bool

New value.

Returns

Nothing.

Example

cb:set_value(true);

container
Last modified: 25 December 2024
This type represents an abstract container.

add
Method
Adds a control to the container.

Arguments

Name

Type

Description

ctrl

control

Control to add.

Returns

Nothing.

Example

container:add(my_control);
remove
Method
Removes a control from the container.

Arguments

Name

Type

Description

ctrl

control

Control to remove.

Returns

Nothing.

Example

container:remove(my_control);
find
Method
Finds a control by ID.

Arguments

Name

Type

Description

id

string

Control ID.

Returns

Type

Description

<control>?

Casted control. Returns nil if the control was not found, or casting failed.

Example

local some_cb = container:find('some_cb');

control_container
Last modified: 25 December 2024
This type represents an abstract control with a container.

layout
Last modified: 25 December 2024
This type represents a layout control.

group
Last modified: 25 December 2024
This type represents a groupbox control.

