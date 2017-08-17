package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.JunJieEvent;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.junjie.bean.JunJieConditionInfo;
	import com.rpgGame.netData.junjie.bean.JunJieInfo;
	import com.rpgGame.netData.junjie.message.SCJunJieActivateResultMessage;
	import com.rpgGame.netData.junjie.message.SCJunJieInfoListMessage;
	import com.rpgGame.netData.junjie.message.SCJunJieInfoUpdateListMessage;
	import com.rpgGame.netData.junjie.message.SCUpdateRoundMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class JunJieManager
	{
		public  static var ins:JunJieManager=new JunJieManager();
		
		private var _junjieInfoList:Vector.<JunJieInfo>;
		private var _power:int=0;
		public function JunJieManager()
		{
			_junjieInfoList=new Vector.<JunJieInfo>();
		}
		
		/**
		 * 获取战力
		 * */
		public function get power():int
		{
			return _power;
		}
		
		/**
		 * 获取当前激活的最大军阶
		 * */
		public function getActivationLv():int
		{
			var lv:int=0;
			if(_junjieInfoList==null||_junjieInfoList.length==0)
			{
				return lv;
			}
			for(var i:int=0;i<_junjieInfoList.length;i++)
			{
				if(_junjieInfoList[i].state==2&&_junjieInfoList[i].modelId>lv)
				{
					lv=_junjieInfoList[i].modelId;
				}
			}
			return lv;
		}
		
		/**
		 * 依据军阶ID获取Info
		 * */
		public function getInfoById(id:int):JunJieInfo
		{
			var info:JunJieInfo=null;
			if(_junjieInfoList==null||_junjieInfoList.length==0)
			{
				return info;
			}
			for(var i:int=0;i<_junjieInfoList.length;i++)
			{
				if(_junjieInfoList[i].modelId==id)
				{
					return _junjieInfoList[i];
				}
			}
			return info;
		}
		
		/**
		 * 更新info
		 * */
		public function updateInfo(info:JunJieInfo):void
		{
			if(_junjieInfoList==null||_junjieInfoList.length==0)
			{
				return;
			}
			for(var i:int=0;i<_junjieInfoList.length;i++)
			{
				if(_junjieInfoList[i].modelId==info.modelId)
				{
					_junjieInfoList[i]=info;
				}
			}
		}
		
		/**
		 * 依据类型获取JunJieConditionInfo
		 * */
		public function getConditionInfoByType(id:int,type:int):JunJieConditionInfo
		{
			var info:JunJieInfo=getInfoById(id);
			if(info==null) return null;
			for(var i:int=0;i<info.junJieConditionInfos.length;i++)
			{
				if(info.junJieConditionInfos[i].type==type)
					return info.junJieConditionInfos[i];
			}
			return null;
		}
		
		/**
		 * 接收所有军阶对象
		 * */
		public function onSCJunJieInfoListMessage(msg:SCJunJieInfoListMessage):void
		{
			_junjieInfoList=msg.junJieInfos;
			_power=msg.fightPower;
			
			var role:SceneRole=MainRoleManager.actor;
			if(role){
				if (role.headFace is HeadFace)
					(role.headFace as HeadFace).updateTitle(getActivationLv());
			}
		}
		
		/**
		 * 激活结果
		 * */
		public function onSCJunJieActivateResultMessage(msg:SCJunJieActivateResultMessage):void
		{
			if(msg.flag==1)
			{
				_power=msg.fightPower;
				updateInfo(msg.junJieInfo);
				
				var role:SceneRole=MainRoleManager.actor;
				if(role)
				{
					(role.data as HeroData).junjieLv=getActivationLv();
					if (role.headFace is HeadFace)
						(role.headFace as HeadFace).updateTitle((role.data as HeroData).junjieLv);
				}
				EventManager.dispatchEvent(JunJieEvent.JUNJIE_JIEGUO,true);
			}
		}
		
		/**
		 * 更新激活条件
		 * */
		public function onSCJunJieInfoUpdateListMessage(msg:SCJunJieInfoUpdateListMessage):void
		{
			if(msg.junJieInfos!=null&&msg.junJieInfos.length>0)
			{
				for(var i:int=0;i<msg.junJieInfos.length;i++)
				{
					updateInfo(msg.junJieInfos[i]);
				}
				EventManager.dispatchEvent(JunJieEvent.JUNJIE_CHANGE);
			}
		}
		
		/**
		 * 更新附近玩家称号
		 * */
		public function onSCUpdateRoundMessage(msg:SCUpdateRoundMessage):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID())as SceneRole;
			if(role)
			{
				(role.data as HeroData).junjieLv=msg.modelId;
				if (role.headFace is HeadFace)
					(role.headFace as HeadFace).updateTitle((role.data as HeroData).junjieLv);
			}
		}
		public function getCanActivation():Boolean
		{
			
			if(_junjieInfoList==null||_junjieInfoList.length==0)
			{
				return false;
			}
			for(var i:int=0;i<_junjieInfoList.length;i++)
			{
				if(_junjieInfoList[i].state==1)
				{
					return true;
				}
			}
			return false;
		}
	}
}