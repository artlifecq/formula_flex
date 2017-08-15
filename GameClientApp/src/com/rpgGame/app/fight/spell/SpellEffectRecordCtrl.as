package com.rpgGame.app.fight.spell
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	
	import flash.utils.Dictionary;

	public class SpellEffectRecordCtrl
	{
		private static const _playeredEffectMap:Dictionary=new Dictionary();
		//一个玩家只记录一个
		private static const _cancelSkillMap:Dictionary=new Dictionary();
		private static const _effectPlayerMap:Dictionary=new Dictionary();
		public static function testEffectShow(player:Number,skill:int):Boolean
		{
			if (_cancelSkillMap[player]==undefined) 
			{
				return true;
			}
			return _cancelSkillMap[player]==skill;
		}
		/**
		 *收到取消消息删除特效 
		 * @param player
		 * @param skill
		 * 
		 */		
		public static function testCancelEffect(player:Number,skill:int):void
		{
			addCancel(player,skill);
			var arr:*=_playeredEffectMap[player];
			//还没记录特效
			if (undefined==arr) 
			{
				return;
			}
			//删除这个技能的所有特效,做个容错有可能特效还没播放
			var len:int=arr.length;
			for (var i:int = 0; i < len; i++) 
			{
				var obj:Object=arr[i];
				if (obj.id==skill&&obj) 
				{
					delete _effectPlayerMap[obj.eff];
					obj.func(obj.eff);
					//obj.eff.dispose();
					obj.eff=null;
					obj.func=null;
				}
			}
			delete _playeredEffectMap[player];
		}
		/**先播放特效，再收到失败的消息，先记录下特效，**/
		public  static function addEffectRecord(player:Number,skill:int,effect:RenderUnit3D,disposeFun:Function):void
		{
			if (SpellDataManager.getSpellData(skill).q_cancel==0) 
			{
				return;
			}
			var arr:*=_playeredEffectMap[player];
			if (undefined==arr) 
			{
				arr=[];
				_playeredEffectMap[player]=arr;
			}
			arr.push({id:skill,eff:effect,func:disposeFun});
			_effectPlayerMap[effect]=player;
		}
		//这个正常播放完的动画
		public static function removeRecord(effect:RenderUnit3D):void
		{
			var player:*=_effectPlayerMap[effect];
			if (undefined==player) 
			{
				return 
			}
			delete _effectPlayerMap[effect];
			var arr:Array=_playeredEffectMap[player];
			if (arr) 
			{
				var len:int=arr.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (arr[i].eff==effect) 
					{
						arr.splice(i,1);
						effect.isHiding=false;
						break;
					}
				}
				if (arr.length==0) 
				{
					delete _playeredEffectMap[player];
				}
			}
		}
		private static function addCancel(player:Number,skill:int):void
		{
			_cancelSkillMap[player]=skill;
		}
		/**
		 *下一次成功了就可以删除 
		 * 
		 */		
		public static function clear(player:Number):void
		{
			if (_cancelSkillMap[player]!=undefined) 
			{
				delete _cancelSkillMap[player];
			}
			if (_playeredEffectMap[player]!=undefined) 
			{
				var arr:Array=_playeredEffectMap[player];
				for each (var obj:Object in arr) 
				{
					obj.eff=null;
					obj.func=null;
				}
				delete _playeredEffectMap[player];
			}
		}
	}
}