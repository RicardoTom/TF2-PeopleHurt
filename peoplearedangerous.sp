#include <sourcemod>
#include <sdkhooks>
#include <sdktools>

#pragma semicolon true 
#pragma newdecls required

public Plugin myinfo =
{
    name = "PeopleAreDangerous",
    author = "fly50",
    description = "If a player touches an enemy player, both die. That's it. Don't ask me why.",
    version = "i don't know",
    url = "URL"
};

public void OnPluginStart(){
    for (int i=0; i<= MaxClients;i++){

        if(i != 0 && IsClientInGame(i)){

            OnClientPutInServer(i);

        }

    }
}

public void OnClientPutInServer(int client){
    SDKHook(client, SDKHook_Touch, peoplHurt);
}

static Action peoplHurt(int client, int other){

    if(!(1 <= other <= MaxClients)){
        return Plugin_Continue;
    }
    
    PrintToChatAll("It appears that the player '%N' touched the player '%N' inappropriately. How disgusting. To Hell with both of you.", other, client);

    PrintCenterText(client, "get fucked m8");
    ForcePlayerSuicide(client);

    PrintCenterText(other, "get fucked m8");
    ForcePlayerSuicide(other);

    return Plugin_Continue;
}