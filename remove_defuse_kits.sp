#include <sdktools>

/* ============================================================================================================
// EN: Notifies the compiler that there should be a character at the end of each expression ;
// RU: Сообщает компилятору о том, что в конце каждого выражения должен стоять символ ;
// ==========================================================================================================*/

#pragma semicolon 1
/* =============================================================================================================
// EN: Notifies the compiler that the plugin syntax is exceptionally new
// RU: Сообщает компилятору о том, что синтаксис плагина исключительно новый
// ===========================================================================================================*/
#pragma newdecls required

/* =============================================================================================================
// EN: Public information about the plugin.
// RU: Общественная информация о плагине.
// ===========================================================================================================*/

public Plugin myinfo = 
{
	/* ============================================================================================================
	// EN: The name of the plugin.
	// RU: Название плагина. 
	// ==========================================================================================================*/
	name = "Remove defuse kits", 
	/* ============================================================================================================
	// EN: The author of the plugin.
	// RU: Автор плагина.
	// ==========================================================================================================*/
	author = "babka68", 
	/* ============================================================================================================
	// EN: A brief description of the plugin.
	// RU: Краткое описание плагина.
	// ==========================================================================================================*/
	description = "Удалить комплекты для обезвреживания после смерти игрока.", 
	/* ============================================================================================================
	// EN: The version of this plugin.
	// RU: Версия данного плагина.
	// ==========================================================================================================*/
	version = "1.0", 
	/* ============================================================================================================
	// EN: Plugin (author's) support site.
	// RU: Сайт поддержки плагина (автора).
	// ===========================================================================================================*/
	url = "https://vk.com/zakazserver68"
};

/* =============================================================================================================
// EN: A built-in global event whose function is a single call when the plugin is fully initialized.
// RU: Встроенное глобальное событие, функция которого - единождый вызов при полной инициализации плагина.
// =============================================================================================================*/
public void OnPluginStart()
{
	HookEvent("player_death", EventPlayerDeath);
}

public void EventPlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	int ent = -1;
	while ((ent = FindEntityByClassname(ent, "item_defuser")) != -1)
	{
		if (IsValidEntity(ent))
		{
			AcceptEntityInput(ent, "kill");
		}
	}
} 