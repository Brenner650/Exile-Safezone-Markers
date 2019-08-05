/**
* createSafezoneMarkers
*
* twist
* Discord: twist#7777
*
*/

params ["_pos", "_radius", "_classname", "_markerName", "_markerType"];
private ["_count", "_marker", "_location", "_markerTitle"];
_count = 0;
_markerTitle = markerText _markerName;

for '_i' from 0 to 360 step (1440 / _radius) do
{
	_location = [(_pos select 0) + ((cos _i) * _radius), (_pos select 1) + ((sin _i) * _radius), 0];
	_marker = _classname createVehicle [0,0,0];
	_marker setPosATL _location;
	_count = _count + 1;
};
diag_log format ["SZ_Markers: Created %1 %2 Marker(s) for %3 at %4", _count, _markerType, _markerTitle, _pos];




