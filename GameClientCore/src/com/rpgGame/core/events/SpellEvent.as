package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class SpellEvent
	{
		/**技能改变**/
		public static const SPELL_CHANGE:int = UNIQUEID.NEXT;
		/**技能导致快捷栏发生改变**/
		public static const SPELL_UPDATE_SHORTCUTS:int = UNIQUEID.NEXT;
		/**主角释放技能**/
		public static const SPELL_HERO_RELEASE_SPELL:int = UNIQUEID.NEXT;
		/**主角快捷键释放技能**/
		public static const SPELL_KEY_RELEASE:int = UNIQUEID.NEXT;
	}
}