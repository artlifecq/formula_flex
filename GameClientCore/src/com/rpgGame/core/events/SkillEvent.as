package com.rpgGame.core.events
{
	import flash.events.Event;
	
	//不知谁建的没人用我改来用了
	/**
	 * 技能发出事件类
	 * @author yt
	 * 
	 */	
	public class SkillEvent extends Event
	{
		public static const SKILL_OPEARATE:String = "SkillOpearate";
		
		/**技能被打断事件*/		
		public static const SKILL_CANCEL:String = "Skill_Cancel";
		/**技能发出事件*/		
		public static const SKILL_ATTACK:String = "Skill_Attack";
		/**技能成功事件*/		
		public static const SKILL_RESULT:String = "Skill_Result";
		
		/**吟唱条开始*/		
		public static const SING_START:String = "Sing_Start";
		/**吟唱条停止*/		
		public static const SING_STOP:String = "Sing_Stop";
		
		public var skillID:int;
		
		
		public function SkillEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}