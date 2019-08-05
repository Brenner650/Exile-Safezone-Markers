/**
* initSafezoneMarkers
*
* twist
* Discord: twist#7777
*
* This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
* To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/



private['_markerPos', '_safezoneMarkers', '_noCombatMarkers', '_safezoneRadius', '_noCombatRadius', '_safezoneMarkerClassname', '_noCombatMarkerClassname', '_traderMarkerName'];

/*Config*/
_safezoneMarkers = true; //---menable/disable safezone markers
_noCombatMarkers = true; //---enable/disable no combat markers
_safezoneRadius = 125; //---safezone marker radius
_noCombatRadius = 250; //---no combat marker radius
_safezoneMarkerClassname = "Sign_sphere100cm_EP1"; //---classname for safezone marker
_noCombatMarkerClassname = "Sign_Sphere200cm_Geometry_F"; //---classname for safezone marker
_traderMarkerName = "ExileTraderZoneIcon";
/*End Config*/

TWServer_createSafezoneMarkers = compile preprocessFileLineNumbers "TWClient\custom\SafezoneMarkers\createSafezoneMarkers.sqf";

if(_safezoneMarkers || _noCombatMarkers) then 
{
	{
		if (getMarkerType _x == _traderMarkerName) then
		{
			_markerPos = getMarkerPos _x;
			if(_safezoneMarkers) then
			{
				[_markerPos, _safezoneRadius, _safezoneMarkerClassname, _x, "Safezone"] call TWServer_createSafezoneMarkers;
			};
			if(_noCombatMarkers) then
			{
				[_markerPos, _noCombatRadius, _noCombatMarkerClassname, _x, "No Combat"] call TWServer_createSafezoneMarkers;
			};
		};
	} forEach allMapMarkers;
};

