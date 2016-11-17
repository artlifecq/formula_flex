package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.BaZhenTuSender;
	import com.rpgGame.app.sender.NpcSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.BaZhenTuEvent;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.coreData.cfg.BaZhenTuCfgData;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.lang.LangBaZhenTu;
	import com.rpgGame.coreData.role.MonsterData;
	
	import app.message.NpcDialogProto.NpcType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	import utils.TimerServer;

	public class BaZhenTuManager
	{
		private static const BUFF_KEY : String = "BA_ZHEN_TU_BUFF_";
		/** 今天进入八阵图副本的次数 **/
		private static var _todayEnterTimes:int=0;
		public static var curWave:int;
		public static var dungeonEndTime:Number;
		public static var nextRefreshTime:Number;
		public static var isWin:Boolean;
		private static var _skillHash:HashMap = new HashMap();
		private static var _shiBeiHash:HashMap = new HashMap();
		/**
		 * 石碑被打了导致某种怪物不能生效 
		 */		
		private static var _shiBeiBuffHash:HashMap = new HashMap();
		
		public function BaZhenTuManager()
		{
		}
		
		public static function setShiBeiBuff(type:int,end:Number):void
		{
			_shiBeiBuffHash.add(type,end);
			var buff : BuffInfo = new BuffInfo(MainRoleManager.actorID);
			buff.setClientBuffInfo(BUFF_KEY+type);
			buff.disappearTime = end;
			EventManager.dispatchEvent(BuffEvent.ADD_BUFF,buff);
		}
		
		public static function getShiBeiBuffEndTime(type:int):Number
		{
			return _shiBeiBuffHash.getValue(type)?_shiBeiBuffHash.getValue(type):0;
		}
		/**
		 * 是否是进入八阵图的ＮＰＣ 
		 * @param npcId
		 * @return 
		 * 
		 */		
		public static function isEnterBaZhenTuNpc( npcId:int ):Boolean
		{
			return NpcCfgData.isFunctionType(npcId, NpcType.ENTER_BA_ZHEN_TU);
		}
		
		public static function enterBaZhenTu(npc:int,index:int):void
		{
			if(TeamManager.isHaveTeam())
			{
				NpcSender.clickNpc(npc, index);
			}else
			{
				var gameAlert : AlertSetInfo = new AlertSetInfo(LangBaZhenTu.LONEY_JOIN_DUNGEON);
				GameAlert.showAlert(gameAlert,onEnterBaZhenTuLonely,npc,index);
			}
		}
		
		private static function onEnterBaZhenTuLonely(gameAlert:GameAlert,npc:int,index:int):void
		{
			if(gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				NpcSender.clickNpc(npc, index);
			}
		}
		
		/**
		 * 是否是离开八阵图的ＮＰＣ 
		 * @param npcId
		 * @return 
		 * 
		 */		
		public static function isLeaveBaZhenTuNpc( npcId:int ):Boolean
		{
			return NpcCfgData.isFunctionType(npcId, NpcType.LEAVE_DUNGEON);
		}
		public static function set todayEnterTimes(value:int):void
		{
			_todayEnterTimes = value;
		}
		public static function get todayEnterTimes():int
		{
			return _todayEnterTimes
		}
		/**
		 * 副本信息
		 *
		 * varint64 副本结束时间
		 *
		 * varint32 当前是第几波
		 * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
		 *
		 * while(buffer.readable()){
		 *      varint32 导致buf不生效的怪物类型，即八卦类型
		 *      varint64 导致buf不生效结束时间
		 * }
		 */
		public static function enterDungeonInfo(buffer:ByteBuffer):void
		{
			_shiBeiHash.clear();
			_skillHash.clear();
			var endTime:Number = buffer.readVarint64();
			var num:int = buffer.readVarint32();
			var nextTime:Number = buffer.readVarint64();
			if(BaZhenTuCfgData.maxWaveCount > num)
			{
				showNewWaveAlert(nextTime);
			}
			dungeonEndTime = endTime;
			curWave = num;
			nextRefreshTime = nextTime;
			EventManager.dispatchEvent(BaZhenTuEvent.BA_ZHEN_TU_DETAIL_UPDATE);
		}
		/**
		 * 新的一波刷新了
		 *
		 * varint32 当前波数
		 * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
		 */
		public static function newWaveUpdate(buffer:ByteBuffer):void
		{
			var num:int = buffer.readVarint32();
			var nextTime:Number = buffer.readVarint64();
			curWave = num;
			nextRefreshTime = nextTime;
			
			if(BaZhenTuCfgData.maxWaveCount > num)
			{
				//剩余时间15s
				showNewWaveAlert(nextTime);
				//剩余时间10s特效
			}
			
			EventManager.dispatchEvent(BaZhenTuEvent.BA_ZHEN_TU_DETAIL_UPDATE);
		}
		
		private static function showNewWaveAlert(newTime : Number):void
		{
			TimerServer.remove(alertNewWave);
			TimerServer.add(alertNewWave,newTime - 15000 - SystemTimeManager.curtTm);
			
			TimerServer.remove(alertDaoJiShi);
			TimerServer.add(alertDaoJiShi,newTime - 10000 - SystemTimeManager.curtTm);
			
		}
		
		private static function alertDaoJiShi():void
		{
			SceneCameraLensEffectManager.playDaoJiShiEffect();
		}
		
		private static function alertNewWave():void
		{
			NoticeManager.showNotify(LangBaZhenTu.NEW_WAVE_UPDATE);
		}
		/**
		 * 队长开启副本 
		 * @param buffer
		 * 
		 */		
		public static function onLeaderStartDungeon(buffer:ByteBuffer):void
		{
			var time:Number = buffer.readVarint64();
			var openId:Number = buffer.readVarint64();
			var openName:String = buffer.readUTFBytes(buffer.bytesAvailable);
			
			TimerServer.remove(cancelAlert);
			GameAlert.showAlertUtil(LangBaZhenTu.LEADER_START_DUNGEON,onLeaderStartDungeonClick,openName);
			TimerServer.add(cancelAlert,30000);
		}
		
		private static function onLeaderStartDungeonClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					okFun();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					cancelFun();
					break;
			}
		}
		private static function okFun() : void
		{
			BaZhenTuSender.argeeReq();
		}
		private static function cancelFun() : void
		{
			BaZhenTuSender.refruseReq();
		}
		
		private static function cancelAlert():void
		{
			BaZhenTuSender.refruseReq();
			GameAlert.closeAlert(LangBaZhenTu.LEADER_START_DUNGEON);
		}
		public static function setSkillData(data:MonsterData,isDel:Boolean = false):void
		{
			if(isDel)
			{
				if(_skillHash.getValue(data.spellId))
				{
					_skillHash.remove(data.spellId);
				}
			}
			else
			{
				if(!_skillHash.getValue(data.spellId))
				{
					_skillHash.add(data.spellId,data);
				}
			}
			
		}
	
		public static function setShiBeiData(data:MonsterData):void
		{
			if(!data.isJihuo)
			{
				if(_shiBeiHash.getValue(data.baGuaType))
				{
					_shiBeiHash.remove(data.baGuaType);
				}
			}
			else
			{
				if(_shiBeiHash.getValue(data.baGuaType) == null)
				{
					_shiBeiHash.add(data.baGuaType,data);
				}
			}
			
		}
		public static function getSkillArr():Array
		{
			return _skillHash.getValues();
		}
		public static function getSkillData(key:int):MonsterData
		{
			return _skillHash.getValue(key);
		}
		public static function getShiBeiArr():Array
		{
			return _shiBeiHash.getValues();
		}
		public static function getShiBeiData(key:int):MonsterData
		{
			return _shiBeiHash.getValue(key);
		}
	}
}