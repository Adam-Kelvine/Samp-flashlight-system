#include <a_samp>
#include <zcmd>


new bool:FlashlightOpen[MAX_PLAYERS];
new PlayerLightObj[MAX_PLAYERS] = {INVALID_OBJECT_ID, ...};
new myobject[MAX_PLAYERS] = {INVALID_OBJECT_ID, ...};
new bool:open[MAX_PLAYERS] = false;
main()
{
    print("\n----------------------------------");
    print(" Flashlight System - Kelvine");
    print("----------------------------------\n");
}

public OnGameModeInit()
{
    SetGameModeText("Flashlight Fixed");
    AddStaticVehicle(411, 2039.2190, 1344.8899, 10.6719, 178.9856, 1, 1);
    
    SetWorldTime(0); 
    return 1;
}

public OnPlayerConnect(playerid)
{
    open[playerid] = false;
    myobject[playerid] = INVALID_OBJECT_ID;
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(myobject[playerid] != INVALID_OBJECT_ID)
    {
        DestroyObject(myobject[playerid]);
        myobject[playerid] = INVALID_OBJECT_ID;
    }
    RemovePlayerAttachedObject(playerid, 0);
    open[playerid] = false;
    return 1;
}

stock ToggleFlashlight(playerid)
{
    if(open[playerid] == true)
    {
        RemovePlayerAttachedObject(playerid, 0);
        ClearAnimations(playerid);
        open[playerid] = false;
        
        if(myobject[playerid] != INVALID_OBJECT_ID)
        {
            DestroyObject(myobject[playerid]);
            myobject[playerid] = INVALID_OBJECT_ID;
        }
    }
    else
    {
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
        SetPlayerAttachedObject(playerid, 0, 18641, 1, 0.354000, 0.170000, -0.090999, 104.600059, 19.699993, 5.399999, 1.000000, 1.000000, 1.000000);
        open[playerid] = true;
        
        SetTimerEx("lant", 1000, false, "d", playerid);
    }
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if((newkeys & 16) && !(oldkeys & 16) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        ToggleFlashlight(playerid);
    }
    return 1;
}

CMD:fl(playerid, params[])
{
    ToggleFlashlight(playerid);
    return 1;
}

forward lant(playerid);
public lant(playerid)
{
    if(!open[playerid]) return 1;
    
    if(myobject[playerid] != INVALID_OBJECT_ID)
    {
        DestroyObject(myobject[playerid]);
    }
    myobject[playerid] = CreateObject(18657, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    AttachObjectToPlayer(myobject[playerid], playerid, 0.0, 2.0, 0.0, 0.0, 1.5, 2);
    return 1;
}